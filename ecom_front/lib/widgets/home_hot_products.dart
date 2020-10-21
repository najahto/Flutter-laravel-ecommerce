import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/widgets/home_hot_product.dart';
import 'package:flutter/material.dart';

class HomeHotProducts extends StatefulWidget {
  final List<Product> productList;
  HomeHotProducts({this.productList});
  @override
  _HomeHotProductsState createState() => _HomeHotProductsState();
}
class _HomeHotProductsState extends State<HomeHotProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
      children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Hot Products',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
                color: Color(0xFF0b090a),
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                color: Color(0xFFA4161A),fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 255,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: this.widget.productList.length,
              itemBuilder: (context, index) {
                var photo = this.widget.productList[index].photo;
                var name = this.widget.productList[index].name;
                var price = this.widget.productList[index].price;
                var discount = this.widget.productList[index].discount;
                return HomeHotProduct(name,photo,price,discount);
              },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 4,
              );
            },
          ),
        )
      ],)
    );
  }
}
