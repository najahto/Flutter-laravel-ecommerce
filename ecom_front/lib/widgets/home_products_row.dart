import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeProducts extends StatefulWidget {
  final String name;
  final List<Product> productList;
  HomeProducts({this.productList,this.name});
  @override
  _HomeProductsState createState() => _HomeProductsState();
}
class _HomeProductsState extends State<HomeProducts> {
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              color: Colors.red,
              child:Text(
                this.widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'SEE ALL',
              style: TextStyle(
                color: Colors.red,fontWeight: FontWeight.w400,
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
                // var photo = this.widget.productList[index].photo;
                // var name = this.widget.productList[index].name;
                // var price = this.widget.productList[index].price;
                // var discount = this.widget.productList[index].discount;
                return ProductItem(this.widget.productList[index]);
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
