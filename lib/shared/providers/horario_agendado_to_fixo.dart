String horarioAtoF(String horarioInicial){
  switch (horarioInicial) {
    case '07:00':
      return '1M2M';
    case '08:55':
      return '3M4M';
    case '10:35':
      return '5M6M';
    case '13:50':
      return '1T2T';
    case '15:50':
      return '3T4T';
    case '16:40':
      return '4T5T';
    case '19:00':
      return '1N2N';
    case '20:55':
      return '3N4N';
    default:
      return '';
  }
}