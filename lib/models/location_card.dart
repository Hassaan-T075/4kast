// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class loc_card extends StatefulWidget {
  final String city_name;
  //final Function remove;

  const loc_card({
    required this.city_name,
    //required this.remove,
  });

  @override
  State<loc_card> createState() => _loc_cardState();
}

class _loc_cardState extends State<loc_card> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.transparent,
      child: GlassmorphicContainer(
        borderRadius: 15,
        width: MediaQuery.of(context).size.width,
        height: 50,
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
        child: ListTile(
          //onLongPress: () => _showContextMenu(context),
          leading: Icon(
            Icons.location_city_outlined,
            color: Colors.white,
          ),
          title: Text(
            widget.city_name,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          dense: true,
          trailing: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
