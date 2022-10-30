// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../models/current_conditions.dart';
import '../models/daily_forecast.dart';
import '../models/hourly_forecast.dart';
import '../providers/get_current_conditions.dart';
import '../providers/get_daily_forecast.dart';
import '../providers/get_hourly_forecast.dart';
import '../providers/get_location_key.dart';
import 'package:weather_app/models/helper_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  static const SystemUiOverlayStyle overlayStyle =
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.black87);

  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  CurrentForecast? current;
  List<Forecast>? twelve_hour;
  DailyForecast? five_day;

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new)),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Location',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                width: 220,
              ),
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/city.png'), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  CSCPicker(

                    layout: Layout.vertical,
                    showStates: true,
                    showCities: true,
                    flagState: CountryFlag.ENABLE,

                    dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.black,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),

                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",

                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State",
                    cityDropdownLabel: "City",

                    selectedItemStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),

                    dropdownHeadingStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),

                    dropdownItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),

                    dropdownDialogRadius: 10.0,
                    searchBarRadius: 10.0,

                    onCountryChanged: (value) {
                      setState(() {
                        //store value in country variable
                        countryValue = value;
                      });
                    },

                    //triggers once state selected in dropdown
                    onStateChanged: (value) {
                      setState(() {
                        //store value in state variable
                        stateValue = value;
                      });
                    },

                    //triggers once city selected in dropdown
                    onCityChanged: (value) {
                      setState(() {
                        //store value in city variable
                        cityValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      highlightColor: Colors.white,
                      onTap: () async {
                        if (cityValue != "") {
                          cities!.add(cityValue.toString());
                          cities = cities!.toSet().toList();

                          currentcity = cityValue.toString();

                          // obtain shared preferences
                          final prefs = await SharedPreferences.getInstance();

                          // set value
                          await prefs.setString('current', currentcity!);

                          prefs.setStringList('city', cities!);

                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  color: Colors.black87,
                                  child: Center(
                                    child: SpinKitSquareCircle(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.purpleAccent),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              });

                          String? lockey = await LocationKey.getLocation(
                              cityValue.toString());

                          //get current weather
                          current = await CurrentConditions.getData(
                              lockey.toString());

                          //get hourly forecast
                          twelve_hour = await GetHourlyForecast.getForecast(
                              lockey.toString());

                          //get daily forecast
                          five_day = await GetDailyForecast.getForecast(
                              lockey.toString());
                          Navigator.pushReplacementNamed(context, "/home_page",
                              arguments: {
                                'current': current,
                                'twelve_hour': twelve_hour,
                                'five_day': five_day,
                                'cityValue': cityValue
                              });
                        }
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: GlassmorphicContainer(
                        borderRadius: 20,
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width,
                        blur: 2,
                        alignment: Alignment.center,
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
                        child: Icon(
                          Icons.check,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
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
