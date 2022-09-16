// ignore_for_file: unused_import, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/current_forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/providers/api_service.dart';
import 'package:weather_app/providers/get_location_key.dart';

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
  final region = TextEditingController(text: '69');

  double? temp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/night1.png'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
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
            ElevatedButton.icon(
              onPressed: () async {
                //get location key
                String? lockey = await LocationKey.getLocation(region.text.toString());
                print(lockey);
                //get forecast
                CurrentForecast? test =
                    await ApiService.getData(lockey.toString());
                //print(test?.isDayTime);
                setState(() {
                  temp = test?.temperature.metric.value;
                });
              },
              icon: const Icon(Icons.cloud_download),
              label: const Text(""),
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  ],
                ),
            Text("$temp", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
