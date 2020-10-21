import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeHotProduct extends StatefulWidget {
  final String name;
  final String photo;
  final String price;
  final String discount;

  HomeHotProduct(this.name, this.photo,this.price,this.discount);
  @override
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        child: InkWell(
          child: Container(
                constraints: BoxConstraints.tight(
                Size(
                150,
                255,
            ),
           ),
            child: Column(
              children: <Widget>[
                Image.network(widget.photo,height: 180.0,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$'+this.widget.price,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Color(0xFFA4161A),
                              size: 20,
                            ),
                          ],
                        ),
                        Text(
                          this.widget.name,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
