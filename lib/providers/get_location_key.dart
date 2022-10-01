// ignore_for_file: unused_import, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/location.dart';

class LocationKey {
  static Future<String?> getLocation(String data) async {
    try {
      
      var url = Uri.parse(Api_constants.url + Api_constants.location + "?apikey=" + Api_constants.api_key + "&q="+data+"&language=en-us&details=true");
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        List<Location> model = locationFromJson(response.body);
        //print(model.length);
        print(url);
        return model[0].key;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}