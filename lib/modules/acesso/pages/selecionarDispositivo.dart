import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:walkthrough/modules/acesso/pages/dispositivo.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:walkthrough/modules/acesso/pages/dispositivo.dart';


class DiscoveryPage extends StatefulWidget {
  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;

  const DiscoveryPage({this.start = true});

  @override
  _DiscoveryPage createState() => new _DiscoveryPage();
}

class _DiscoveryPage extends State<DiscoveryPage> {
  late StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
  List<BluetoothDiscoveryResult> results = [];
  late bool isDiscovering;

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        results.add(r);
      });
    });

    _streamSubscription.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  // @TODO . One day there should be `_pairDevice` on long tap on something... ;)

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _streamSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isDiscovering
            ? Text('Discovering devices')
            : Text('Discovered devices'),
        actions: <Widget>[
          isDiscovering
              ? FittedBox(
                  child: Container(
                    margin: new EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: _restartDiscovery,
                )
        ],
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, index) {
          BluetoothDiscoveryResult result = results[index];
          return BluetoothDeviceListEntry(
            device: result.device,
            rssi: result.rssi,
            onTap: () {
              Navigator.of(context).pop(result.device);
            },
          );
        },
      ),
    );
  }
}

// class SelecionarDispositivoPage extends StatefulWidget {
//   /// If true, on page start there is performed discovery upon the bonded devices.
//   /// Then, if they are not avaliable, they would be disabled from the selection.
//   final bool checkAvailability;
//   final Function onCahtPage;

//   const SelecionarDispositivoPage(
//       {this.checkAvailability = true, required this.onCahtPage});

//   @override
//   _SelecionarDispositivoPage createState() => _SelecionarDispositivoPage();
// }

// enum _DeviceAvailability {
//   no,
//   maybe,
//   yes,
// }

// class _DeviceWithAvailability extends BluetoothDevice {
//   BluetoothDevice dispositivo;
//   _DeviceAvailability availability;
//   int? rssi;

//   _DeviceWithAvailability(this.dispositivo, this.availability, [this.rssi]);
// }

// class _SelecionarDispositivoPage extends State<SelecionarDispositivoPage> {
//   List<_DeviceWithAvailability> devices = List<_DeviceWithAvailability>();

//   // Availability
//   StreamSubscription<BluetoothDiscoveryResult> _discoveryStreamSubscription;
//   bool _isDiscovering = false;

//   _SelecionarDispositivoPage();

//   @override
//   void initState() {
//     super.initState();

//     _isDiscovering = widget.checkAvailability;

//     if (_isDiscovering) {
//       _startDiscovery();
//     }

//     // Setup a list of the bonded devices
//     FlutterBluetoothSerial.instance
//         .getBondedDevices()
//         .then((List<BluetoothDevice> bondedDevices) {
//       setState(() {
//         devices = bondedDevices
//             .map(
//               (device) => _DeviceWithAvailability(
//                 device,
//                 widget.checkAvailability
//                     ? _DeviceAvailability.maybe
//                     : _DeviceAvailability.yes,
//               ),
//             )
//             .toList();
//       });
//     });
//   }

//   void _restartDiscovery() {
//     setState(() {
//       _isDiscovering = true;
//     });

//     _startDiscovery();
//   }

//   void _startDiscovery() {
//     _discoveryStreamSubscription =
//         FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       setState(() {
//         Iterator i = devices.iterator;
//         while (i.moveNext()) {
//           var _device = i.current;
//           if (_device.device == r.device) {
//             _device.availability = _DeviceAvailability.yes;
//             _device.rssi = r.rssi;
//           }
//         }
//       });
//     });

//     _discoveryStreamSubscription.onDone(() {
//       setState(() {
//         _isDiscovering = false;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // Avoid memory leak (`setState` after dispose) and cancel discovery
//     _discoveryStreamSubscription?.cancel();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<ListaBluetooth> list = devices
//         .map(
//           (_device) => ListaBluetooth(
//             dispositivo: _device.dispositivo,
//             // rssi: _device.rssi,
//             // enabled: _device.availability == _DeviceAvailability.yes,
//             onTap: () {
//               widget.onCahtPage(_device.dispositivo);
//             },
//           ),
//         )
//         .toList();
//     return ListView(
//       children: list,
//     );
//   }
// }