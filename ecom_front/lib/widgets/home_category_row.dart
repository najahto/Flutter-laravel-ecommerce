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
                Text(
                  'Categories',
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
                var icon = this.widget.categoryList[index].icon;
                var name = this.widget.categoryList[index].name;
                return HomeCategoryItem(icon, name);
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
