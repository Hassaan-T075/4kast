// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/current_conditions.dart';
import 'package:weather_app/models/hourly_forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/helper_functions.dart';
import 'package:weather_app/providers/get_current_conditions.dart';
import 'package:weather_app/providers/get_location_key.dart';
import 'package:weather_app/providers/get_hourly_forecast.dart';
import 'package:weather_app/providers/get_daily_forecast.dart';
import 'package:weather_app/models/daily_forecast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'Weather App'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? test = "";
  final region = TextEditingController(text: 'Miami');

  int temp = 0;
  String img = 'city3.jpg';
  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;
  int list_size = 0;
  int day_list_size = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade900,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$img'), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: region,
                      autofocus: false,
                      decoration: InputDecoration(
                        //iconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 100,
                    onPressed: () async {
                      //get location key
                      String? lockey =
                          await LocationKey.getLocation(region.text.toString());
                      //print(lockey);

                      //get current weather
                      current =
                          await CurrentConditions.getData(lockey.toString());

                      //get hourly forecast
                      twelve_hour = await GetHourlyForecast.getForecast(
                          lockey.toString());

                      //get daily forecast
                      five_day =
                          await GetDailyForecast.getForecast(lockey.toString());

                      img = current!.isDayTime ? 'day1.jfif' : 'night2.jfif';
                      temp = round_off(current!.temperature.metric.value);

                      list_size = twelve_hour!.length;

                      day_list_size = five_day!.dailyForecasts.length;

                      setState(() {});
                    },
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                  ),
                  Text(
                    "$temp °C",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            itemCount: list_size,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shadowColor: Colors.transparent,
                                color: (current!.isDayTime)
                                    ? Colors.yellow
                                    : Colors.greenAccent,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                //shadowColor: Colors.amber,
                                child: SizedBox(
                                    width: 100,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${round_off(twelve_hour![index].temperature.value)} °C',
                                            style: TextStyle(
                                                color: (index % 2 == 0)
                                                    ? Colors.white
                                                    : (current!.isDayTime)
                                                        ? Colors.orange
                                                        : Colors.cyan,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(twelve_hour![index]
                                              .dateTime
                                              .substring(11, 16)),
                                        ])),
                                //height: 50,
                                //color: Colors.amber,
                                //child: Center(child: Text('Entry')),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 156, 178, 130),
                        border: Border.all(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        itemCount: day_list_size,
                        itemBuilder: (context, index) {
                          return Card(
                            shadowColor: Colors.transparent,
                            color: Colors.transparent,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${five_day?.dailyForecasts[index].date.month} / ${five_day?.dailyForecasts[index].date.day}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  (index == 0)
                                      ? Text(
                                          'TDY',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      : Text(
                                          week_day(five_day!
                                              .dailyForecasts[index]
                                              .date
                                              .weekday),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                  Image.network(
                                    'https://developer.accuweather.com/sites/default/files/01-s.png',
                                    scale: 1.5,
                                  ),
                                  Text(
                                    "${round_off(five_day!.dailyForecasts[index].temperature.maximum.value)}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Text(
                                    "${round_off(five_day!.dailyForecasts[index].temperature.maximum.value)}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ]),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
