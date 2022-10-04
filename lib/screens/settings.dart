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
            toolbarHeight: 40,
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                )),
            // ignore: prefer_const_literals_to_create_immutables
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
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.location_city_outlined),
                      title: Text('Miami'),
                      dense: true,
                      trailing: Icon(Icons.menu),
                    ),
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
