import 'package:ecom_front/models/category.dart';
import 'package:ecom_front/widgets/home_category_item.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatefulWidget {
  final List<Category> categoryList;
  CategoryRow({this.categoryList});

  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                    'CATEGORIES',
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: this.widget.categoryList.length,
              itemBuilder: (context, index) {
                var id = this.widget.categoryList[index].id;
                var icon = this.widget.categoryList[index].icon;
                var name = this.widget.categoryList[index].name;
                return HomeCategoryItem(id, name,icon);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 4,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
