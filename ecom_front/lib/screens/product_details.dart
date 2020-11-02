import 'package:ecom_front/models/product.dart';
import 'package:ecom_front/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network( widget.product.photo,fit: BoxFit.fill,
              loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null ?
                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("name".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  Text(widget.product.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Price".toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  Text(
                    '\$' + '${ double.parse(this.widget.product.price) - double.parse(this.widget.product.discount)}',
                    style: TextStyle(
                        color:  Colors.black54,
                        fontSize: 16,
                        fontFamily: 'Roboto-Light.ttf',
                        fontWeight: FontWeight.w500,
                        decoration:TextDecoration.lineThrough
                    ),
                  ),
                  Text(
                    '\$' + this.widget.product.price.toString(),
                    style: TextStyle(
                      color:  Color(0xFFA4161A),
                      fontSize: 20,
                      fontFamily: 'Roboto-Light.ttf',
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              color: Color(0xFFFFFFFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF565656))),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Lorem fggggggg ggggsdgsd sdddddddddddd dddddd ddd",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4c4c4c))),
                ],
              ),
            ),

          ],

        ),

      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.favorite_border,
                color: Color(0xFF5e5e5e),
              ),
            ),
            Expanded(
                child: MaterialButton(
                    elevation: 0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.all(
                            Radius.circular(10)
                        ),
                        side: BorderSide(color: Color(0xFFff665e))),
                    onPressed: () {},
                    color: Color(0xFFff665e),
                    textColor: Colors.white,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
                      child: Text("Add To Cart".toUpperCase(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF))),
                    ),
                  ),


            ),
          ],
        ),
      ),
    );
  }
}
