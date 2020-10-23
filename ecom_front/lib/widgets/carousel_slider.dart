import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

Widget carouselSlider(items) => Padding(
  padding: EdgeInsets.only(left: 10, right: 10 ,top: 10,bottom: 5),
  child: Container(
    height: 150.0,
    width: double.infinity,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: items,
      autoplay: true,
      dotSpacing: 15.0,
      dotSize: 4.0,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.black54.withOpacity(0.2),
      noRadiusForIndicator: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 10000),
    ),
  ),
);