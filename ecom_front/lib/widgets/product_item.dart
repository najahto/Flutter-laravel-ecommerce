import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/screens/product_details.dart';
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
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: InkWell(
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(this.widget.product)));
      } ,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          elevation: 0,
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
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child:  Row(
                      children: <Widget>[
                        Spacer(),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 22,
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Image.network(widget.product.photo,
                        width: 150, height: 150),
                  ),
                  Padding(
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
                              '\$' + this.widget.product.price,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            if(double.parse(this.widget.product.discount) > 0)
                              Text(
                                '\-'+this.widget.product.discount+'%',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              )
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
                            Expanded(
                              child: Text(
                                (this.widget.product.name.length <= 40
                                    ? this.widget.product.name
                                    : this.widget.product.name.substring(0, 40)),
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                ),
                              ),
                            )

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
