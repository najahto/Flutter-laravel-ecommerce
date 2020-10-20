import 'package:ecom_front/services/slider_service.dart';
import 'package:flutter/material.dart';
import '../services/slider_service.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();

  @override
  void initState(){
    super.initState();
    _getAllSliders();
  }

  _getAllSliders() async{
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
        backgroundColor: Colors.teal,
      ),
      body: Center(child: Text('Welcome to eCommerce App'),),
    );
  }
}
