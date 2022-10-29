// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/helper_functions.dart';

import '../models/current_conditions.dart';
import '../models/daily_forecast.dart';
import '../models/hourly_forecast.dart';
import '../providers/get_current_conditions.dart';
import '../providers/get_daily_forecast.dart';
import '../providers/get_hourly_forecast.dart';
import '../providers/get_location_key.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key});

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;

  Future<void> _loadInfo() async {
    final prefs = await SharedPreferences.getInstance();

    cities = prefs.getStringList('city');

    if (cities!.isNotEmpty) {
      currentcity = prefs.getString('current');

      String? lockey = await LocationKey.getLocation(currentcity.toString());
      //print(lockey);

      //get current weather
      current = await CurrentConditions.getData(lockey.toString());

      //get hourly forecast
      twelve_hour = await GetHourlyForecast.getForecast(lockey.toString());

      //get daily forecast
      five_day = await GetDailyForecast.getForecast(lockey.toString());
    }

    (cities!.isEmpty)
        ? Navigator.pushReplacementNamed(context, '/choose_location')
        : Navigator.pushReplacementNamed(context, "/home_page", arguments: {
            'current': current,
            'twelve_hour': twelve_hour,
            'five_day': five_day,
            'cityValue': currentcity
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: SpinKitCubeGrid(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.blue : Colors.yellow,
            ),
          );
        },
      ),
    );
  }
}
