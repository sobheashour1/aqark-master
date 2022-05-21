import 'package:flutter/material.dart';
import 'package:aqark/app_data.dart';
import 'package:aqark/widget/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 8/8.5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      children: Categories_data.map((categoryData) =>
          CategoryItem(titles:categoryData.title,images: categoryData.imageUrl,id : categoryData.id ,)).toList(),
      ),
    );
  }
}

