// ignore_for_file: unused_import, avoid_print

import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/models/location.dart';

class GetDailyForecast {
  static Future<DailyForecast> getForecast(String key) async {
    try {
      
      var url = Uri.parse(Api_constants.url + Api_constants.daily + key +"?apikey=" + Api_constants.api_key + "&metric=true");

      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DailyForecast model = dailyForecastFromJson(response.body);
        //print(model.length);
        print(url);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    throw
    {

    };
  }
}