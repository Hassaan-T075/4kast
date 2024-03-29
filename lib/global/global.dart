// ignore_for_file: non_constant_identifier_names

int round_off(double val) {
  if (val >= val.floor() + 0.5) {
    return val.ceil().toInt();
  } else {
    return val.floor().toInt();
  }
}

List<String> icons = [
  "https://developer.accuweather.com/sites/default/files/01-s.png",
  "https://developer.accuweather.com/sites/default/files/02-s.png",
  "https://developer.accuweather.com/sites/default/files/03-s.png",
  "https://developer.accuweather.com/sites/default/files/04-s.png",
  "https://developer.accuweather.com/sites/default/files/05-s.png",
  "https://developer.accuweather.com/sites/default/files/06-s.png",
  "https://developer.accuweather.com/sites/default/files/07-s.png",
  "https://developer.accuweather.com/sites/default/files/08-s.png",
  "https://developer.accuweather.com/sites/default/files/08-s.png",
  "https://developer.accuweather.com/sites/default/files/08-s.png",
  "https://developer.accuweather.com/sites/default/files/11-s.png",
  "https://developer.accuweather.com/sites/default/files/12-s.png",
  "https://developer.accuweather.com/sites/default/files/13-s.png",
  "https://developer.accuweather.com/sites/default/files/14-s.png",
  "https://developer.accuweather.com/sites/default/files/15-s.png",
  "https://developer.accuweather.com/sites/default/files/16-s.png",
  "https://developer.accuweather.com/sites/default/files/17-s.png",
  "https://developer.accuweather.com/sites/default/files/18-s.png",
  "https://developer.accuweather.com/sites/default/files/19-s.png",
  "https://developer.accuweather.com/sites/default/files/20-s.png",
  "https://developer.accuweather.com/sites/default/files/21-s.png",
  "https://developer.accuweather.com/sites/default/files/22-s.png",
  "https://developer.accuweather.com/sites/default/files/23-s.png",
  "https://developer.accuweather.com/sites/default/files/24-s.png",
  "https://developer.accuweather.com/sites/default/files/25-s.png",
  "https://developer.accuweather.com/sites/default/files/26-s.png",
  "https://developer.accuweather.com/sites/default/files/26-s.png",
  "https://developer.accuweather.com/sites/default/files/26-s.png",
  "https://developer.accuweather.com/sites/default/files/29-s.png",
  "https://developer.accuweather.com/sites/default/files/30-s.png",
  "https://developer.accuweather.com/sites/default/files/31-s.png",
  "https://developer.accuweather.com/sites/default/files/32-s.png",
  "https://developer.accuweather.com/sites/default/files/33-s.png",
  "https://developer.accuweather.com/sites/default/files/34-s.png",
  "https://developer.accuweather.com/sites/default/files/35-s.png",
  "https://developer.accuweather.com/sites/default/files/36-s.png",
  "https://developer.accuweather.com/sites/default/files/37-s.png",
  "https://developer.accuweather.com/sites/default/files/38-s.png",
  "https://developer.accuweather.com/sites/default/files/39-s.png",
  "https://developer.accuweather.com/sites/default/files/40-s.png",
  "https://developer.accuweather.com/sites/default/files/41-s.png",
  "https://developer.accuweather.com/sites/default/files/42-s.png",
  "https://developer.accuweather.com/sites/default/files/43-s.png",
  "https://developer.accuweather.com/sites/default/files/44-s.png",
];

List<String>? cities = [];
String? currentcity = '';

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
