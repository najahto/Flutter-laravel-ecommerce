import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget AppBarWidget() {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Image.asset(
      "assets/images/logo.png",
      width: 80,
      height: 40,
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
        },
        icon: Icon(FontAwesomeIcons.opencart),
        color: Colors.black,
      ),
    ],
  );
}