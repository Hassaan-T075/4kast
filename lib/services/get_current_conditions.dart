// ignore_for_file: unused_import, avoid_print

import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/current_conditions.dart';

class CurrentConditions {
  static Future<CurrentForecast?> getData(String key) async {
    try {
      var url = Uri.parse(Api_constants.url + Api_constants.current + key + "?apikey=" + Api_constants.api_key + "&language=en-us&details=true");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CurrentForecast> model = CurrentForecastFromJson(response.body);
        return model[0];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}