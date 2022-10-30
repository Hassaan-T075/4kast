// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/screens/choose_location.dart';
import 'package:weather_app/screens/settings.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/loading_screen.dart';

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
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadData(),
        '/home_page':(context) => MyHomePage(),
        '/settings': (context) => Settings(),
        '/choose_location': (context) => ChooseLocation(),
      },
    );
  }
}
