// ignore_for_file: non_constant_identifier_names

int round_off(double val) {
  if (val >= val.floor() + 0.5) {
    return val.ceil().toInt();
  } else {
    return val.floor().toInt();
  }
}

String week_day(int val) {
  switch (val) {
    case 1:
      {
        return 'MON';
      }
    case 2:
      {
        return 'TUE';
      }
    case 3:
      {
        return 'WED';
      }
    case 4:
      {
        return 'THU';
      }
    case 5:
      {
        return 'FRI';
      }
    case 6:
      {
        return 'SAT';
      }
    case 7:
      {
        return 'SUN';
      }
    default:
      {
        return 'Invalid';
      }
  }
}
