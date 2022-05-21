import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String titles;
  final String images;

  CategoryItem({
    required this.id,
    required this.titles,
    required this.images,
  });

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/category_tripe_screen', arguments: {
      'id': id,
      'titles': titles,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              images,
              height: 300,
              fit: BoxFit.cover,
              width: 250,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                titles,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
