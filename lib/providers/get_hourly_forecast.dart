// ignore_for_file: unused_import, avoid_print

import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/hourly_forecast.dart';
import 'package:weather_app/models/location.dart';

class GetHourlyForecast {
  static Future<List<Forecast>?> getForecast(String key) async {
    try {
      
      var url = Uri.parse(Api_constants.url + Api_constants.hourly + key +"?apikey=" + Api_constants.api_key + "&metric=true");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Forecast> model = forecastFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}