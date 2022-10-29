// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/screens/choose_location.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/models/helper_functions.dart';
import 'package:weather_app/models/arguments.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute: (settings) {
      //     if (settings.name == '/') {
      //       final Object? args = settings.arguments;
      //       return MaterialPageRoute(
      //         builder: (context) {
      //           return MyHomePage(

      //           );
      //         },
      //       );
      //     }
      //     assert(false, 'Implementation ${settings.name}');
      //     return null;
      //   },
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/load',
      routes: {
        '/': (context) => MyHomePage(),
        '/load':(context) => LoadData(),
        '/settings': (context) => Settings(),
        '/choose_location': (context) => ChooseLocation(),
      },
      //home: const MyHomePage(title: 'Weather App'),
      //home: const MyHomePage(),
    );
  }
}
