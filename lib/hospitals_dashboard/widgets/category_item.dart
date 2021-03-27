import 'package:flutter/material.dart';
import 'package:queueless/data_classes/category_class.dart';

class CategoryItem extends StatelessWidget {
  final Categories category;

  const CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/${category.categoryIconPath}',
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              category.categoryName,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
