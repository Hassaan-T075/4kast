// ignore_for_file: camel_case_types

import 'package:weather_app/models/current_conditions.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/models/hourly_forecast.dart';

class Arguments {
  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;

  Arguments({this.current, this.twelve_hour, this.five_day});
}
