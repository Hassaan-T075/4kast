// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class Api_constants {
  static String url = "http://dataservice.accuweather.com";
  static String current = "/currentconditions/v1/";
  static String hourly = "/forecasts/v1/hourly/12hour/";
  static String location = "/locations/v1/search";
  static String daily = "/forecasts/v1/daily/5day/";
  static String api_key = "JwFMrQGlaMAOzJ5g8W4fv4nEkdy5ya94";
  static final region = TextEditingController(text: '');
}
