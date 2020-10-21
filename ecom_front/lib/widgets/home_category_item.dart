import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeCategoryItem extends StatefulWidget {
  final String categoryIcon;
  final String categoryName;
  HomeCategoryItem(this.categoryIcon, this.categoryName);
  @override
  _HomeCategoryItemState createState() => _HomeCategoryItemState();
}

class _HomeCategoryItemState extends State<HomeCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.network(widget.categoryIcon,width: 120, height: 70,),
            Expanded(
              child: Center(
                child: Text(
                  widget.categoryName,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
