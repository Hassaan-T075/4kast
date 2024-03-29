// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/current_conditions.dart';
import 'package:weather_app/models/hourly_forecast.dart';
import 'package:weather_app/global/global.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_app/constants/api_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? test = "";

  Map data = {};

  int temp = 0;
  String img = 'city.png';
  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;
  int list_size = 0;
  int day_list_size = 0;
  Color top_row = Colors.purple.shade900;
  String? city;

  static SystemUiOverlayStyle overlayStyle =
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.purple.shade900);

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      current = data['current'];
      twelve_hour = data['twelve_hour'];
      five_day = data['five_day'];
      city = data['cityValue'];

      img = current!.isDayTime ? 'day1.jfif' : 'night2.jfif';
      temp = round_off(current!.temperature.metric.value);

      list_size = twelve_hour!.length;

      day_list_size = five_day!.dailyForecasts.length;

      (current!.isDayTime)
          ? top_row = Color.fromARGB(255, 239, 113, 44)
          : top_row = Color.fromARGB(255, 18, 18, 17);

      (current!.isDayTime)
          ? overlayStyle =
              SystemUiOverlayStyle(systemNavigationBarColor: Colors.black)
          : overlayStyle =
              SystemUiOverlayStyle(systemNavigationBarColor: Colors.black);
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Container(
        color: top_row,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$img'), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ListView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            (city != null) ? city.toString() : '',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.pushNamed(context, '/settings');
                            }),
                            child: Icon(
                              Icons.more_horiz,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        (current != null) ? "$temp °C" : "- °C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        (current != null) ? "${current!.weatherText}" : "-",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
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
                                    color: Colors.transparent,
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: GlassmorphicContainer(
                                      borderRadius: 20,
                                      width: 100,
                                      height: 100,
                                      blur: 2,
                                      alignment: Alignment.bottomCenter,
                                      border: 1,
                                      linearGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFffffff).withOpacity(0.1),
                                            Color(0xFFFFFFFF).withOpacity(0.05),
                                          ],
                                          stops: [
                                            0.1,
                                            1,
                                          ]),
                                      borderGradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFffffff).withOpacity(0.5),
                                          Color((0xFFFFFFFF)).withOpacity(0.5),
                                        ],
                                      ),
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
                                                        ? Colors
                                                            .deepOrangeAccent
                                                        : Colors.cyan,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            twelve_hour![index]
                                                .dateTime
                                                .substring(11, 16),
                                            style: TextStyle(
                                              color: (index % 2 == 0)
                                                  ? Colors.white
                                                  : (current!.isDayTime)
                                                      ? Colors.deepOrangeAccent
                                                      : Colors.cyan,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                      SizedBox(
                        height: 25,
                      ),
                      (five_day != null)
                          ? GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3.9,
                              borderRadius: 20,
                              blur: 2,
                              alignment: Alignment.bottomCenter,
                              border: 1,
                              linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.1),
                                    Color(0xFFFFFFFF).withOpacity(0.05),
                                  ],
                                  stops: [
                                    0.1,
                                    1,
                                  ]),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFffffff).withOpacity(0.5),
                                  Color((0xFFFFFFFF)).withOpacity(0.5),
                                ],
                              ),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: day_list_size,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      shadowColor: Colors.transparent,
                                      color: Colors.transparent,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (five_day!.dailyForecasts[index]
                                                          .date.day <
                                                      9)
                                                  ? "${five_day?.dailyForecasts[index].date.month} / 0${five_day?.dailyForecasts[index].date.day}"
                                                  : "${five_day?.dailyForecasts[index].date.month} / ${five_day?.dailyForecasts[index].date.day}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
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
                                              icons[five_day!
                                                  .dailyForecasts[index]
                                                  .day
                                                  .icon],
                                              scale: 1.5,
                                            ),
                                            Text(
                                              "${round_off(five_day!.dailyForecasts[index].temperature.minimum.value)}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "${round_off(five_day!.dailyForecasts[index].temperature.maximum.value)}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ]),
                                    );
                                  }),
                            )
                          : SizedBox(
                              height: 177,
                            ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                (current != null)
                                    ? " ${current!.wind.speed.metric.value}km/h"
                                    : "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Feels like",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                (current != null)
                                    ? "${round_off(current!.realFeelTemperature.metric.value)} °C"
                                    : "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                (current != null)
                                    ? " ${current!.relativeHumidity}%"
                                    : "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
