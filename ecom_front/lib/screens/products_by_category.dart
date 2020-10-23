import 'dart:convert';

import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/services/product_service.dart';
import 'package:ecom_front/widgets/app_bar.dart';
import 'package:ecom_front/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ProductsByCategory extends StatefulWidget {
  final int categoryid;
  final String categoryName;

  ProductsByCategory(this.categoryid,this.categoryName);

  @override
  _ProductsByCategoryState createState() => _ProductsByCategoryState();
  }

class _ProductsByCategoryState extends State<ProductsByCategory> {
  List<Product> _productList = List<Product>();

  ProductService _productService = ProductService();

  @override

  void initState(){
    super.initState();
    _getProductsByCategory();
  }

  _getProductsByCategory() async {
    var products = await _productService.getProductsByCategory(this.widget.categoryid);
    var result = json.decode(products.body);
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
      appBar: AppBarWidget(),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(bottom: 11),
                child: Text(
                  widget.categoryName,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.custom(
                gridDelegate: MySliver(),
                childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                     return ProductItem(this._productList[index]);
                  },
                  childCount: _productList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliver extends SliverGridDelegate {
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    double w = 150;
    double h = 255;
    return SliverGridRegularTileLayout(
      mainAxisStride: h,
      crossAxisStride: (constraints.crossAxisExtent) - w,
      childMainAxisExtent: 255,
      childCrossAxisExtent: 150,
      reverseCrossAxis: false,
      crossAxisCount: 2,
    );
  }

  @override
  bool shouldRelayout(MySliver oldDelegate) {
    return false;
  }
}
