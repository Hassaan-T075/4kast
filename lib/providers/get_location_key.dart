// ignore_for_file: unused_import, avoid_print

import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_constants.dart';
//import 'package:weather_app/models/current_forecast.dart';
import 'package:weather_app/models/location.dart';

class LocationKey {
  static Future<String?> getLocation(String data) async {
    try {
      // final response =
      // await http.get(Uri.parse(API_URL + "products"));
      
      var url = Uri.parse(Api_constants.url + Api_constants.location + "?apikey=" + Api_constants.api_key + "&q="+data+"&language=en-us&details=true");
      print(url);
      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<Location> model = locationFromJson(response.body);
        //return _model;
        print(model.length);
        return model[0].key;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}