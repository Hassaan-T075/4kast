// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static const SystemUiOverlayStyle overlayStyle =
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new)),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              Icon(Icons.add),
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
            child: Column(
              children: [
                Row(
                  children: [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
