import 'package:ecom_front/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem(this.product);
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
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
                Image.network(widget.product.photo,height: 180.0,),
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
                              '\$'+this.widget.product.price,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 20,
                            ),
                            // Icon(
                            //   Icons.favorite,
                            //   color: Color(0xFFA4161A),
                            //   size: 20,
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              this.widget.product.name,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            // if(double.parse(this.widget.product.discount) > 0)
                            //   Text(
                            //     '\-'+this.widget.product.discount+'%',
                            //     style: TextStyle(
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 16,
                            //     ),
                            //   )

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
