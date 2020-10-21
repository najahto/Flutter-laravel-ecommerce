import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:ecom_front/models/category.dart';
import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/services/slider_service.dart';
import 'package:ecom_front/widgets/home_category_row.dart';
import 'package:ecom_front/widgets/home_hot_products.dart';

import '../services/slider_service.dart';
import '../services/category_service.dart';
import '../services/product_service.dart';

import '../widgets/carousel_slider.dart';
import '../widgets/search.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SliderService _sliderService = SliderService();
  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService();

  List<Category> _categoryList = List<Category>();
  List<Product> _productList = List<Product>();

  var items =[];

  @override
  void initState(){
    super.initState();
    _getAllSliders();
    _getAllCategories();
    _getHotProducts();
  }

  _getAllSliders() async{
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['data'].forEach((data){
       setState(() {
         items.add( NetworkImage("http://10.0.2.2:8000/"+data['image_url']));
         print(items);
       });
    });
    print(result);
  }

  _getAllCategories() async{
    var categories = await  _categoryService.getCategories();
    var result = json.decode(categories.body);
    result['data'].forEach((data){
      var category = Category();
      category.id = data['id'];
      category.name = data['name'];
      category.icon = "http://10.0.2.2:8000/"+data['icon'];
      setState(() {
        _categoryList.add(category);
      });
    });
  }

  _getHotProducts() async{
    var hotProducts = await _productService.getHotProducts();
    var result = json.decode(hotProducts.body);
    result['data'].forEach((data){
      var product = Product();
      product.id = data['id'];
      product.name = data['name'];
      product.price = data['price'].toString();
      product.discount = data['discount'].toString();
      product.photo = "http://10.0.2.2:8000/"+data['photo'];
      setState(() {
        _productList.add(product);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Container(
        child: ListView(
          children: <Widget>[
            SearchWidget(),
            carouselSlider(items),

            CategoryRow(categoryList: _categoryList,),
            HomeHotProducts(productList: _productList,),
            // HomeHotProducts(productList: _productList,)
          ],
        ),
      ),
    );
  }
}
