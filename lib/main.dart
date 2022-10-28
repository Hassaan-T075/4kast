// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/screens/choose_location.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/models/arguments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: '/choose_location',
      routes: {
        '/': (context) => MyHomePage(),
        '/settings': (context) => Settings(),
        '/choose_location': (context) => ChooseLocation(),
      },
      //home: const MyHomePage(title: 'Weather App'),
      //home: const MyHomePage(),
    );
  }
}
