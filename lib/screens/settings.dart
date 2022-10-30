// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/models/location_card.dart';
import '../models/current_conditions.dart';
import '../models/daily_forecast.dart';
import '../models/hourly_forecast.dart';
import '../providers/get_current_conditions.dart';
import '../providers/get_daily_forecast.dart';
import '../providers/get_hourly_forecast.dart';
import '../providers/get_location_key.dart';
import 'package:weather_app/models/helper_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static const SystemUiOverlayStyle overlayStyle =
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.black87);

  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(BuildContext context, String city) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            height: 10,
            value: 'delete',
            child: Text('Delete'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'delete':
        {
          setState(() {
            cities!.remove(city);
          });

          // obtain shared preferences
          final prefs = await SharedPreferences.getInstance();

          // set value
          prefs.setStringList('city', cities!);
        }
        break;
    }
  }

  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose_location');
                  },
                  icon: Icon(Icons.add)),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/loc.jpg'), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  Divider(
                    thickness: 0.15,
                    //height: 10,
                    color: Colors.white,
                  ),
                  Column(
                    children: cities!
                        .map((city) => GestureDetector(
                              onTap: () async {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.black87,
                                        child: Center(
                                          child: SpinKitSquareCircle(
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    });

                                currentcity = city;

                                final prefs =
                                    await SharedPreferences.getInstance();

                                // set value
                                await prefs.setString('current', currentcity!);

                                String? lockey = await LocationKey.getLocation(
                                    city.toString());

                                //get current weather
                                current = await CurrentConditions.getData(
                                    lockey.toString());

                                //get hourly forecast
                                twelve_hour =
                                    await GetHourlyForecast.getForecast(
                                        lockey.toString());

                                //get daily forecast
                                five_day = await GetDailyForecast.getForecast(
                                    lockey.toString());

                                Navigator.pushReplacementNamed(context, "/",
                                    arguments: {
                                      'current': current,
                                      'twelve_hour': twelve_hour,
                                      'five_day': five_day,
                                      'cityValue': city
                                    });
                              },
                              onTapDown: (details) => _getTapPosition(details),
                              onLongPress: () =>
                                  _showContextMenu(context, city),
                              child: loc_card(
                                city_name: city,
                              ),
                            ))
                        .toList(),
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
