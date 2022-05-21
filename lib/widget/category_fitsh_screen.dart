import 'package:aqark/widget/data_items.dart';
import 'package:flutter/material.dart';
import 'package:aqark/app_data.dart';

class CategoryTripeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String?, String>;

    final categoryId = routeArgument['id'];
    final categoryTitles = routeArgument['titles'];
    final filteredData = Pass_data.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      backgroundColor:Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Text(categoryTitles!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return DataItemsScreen(
            id: filteredData[index].id,
            categories: filteredData[index].categories,
            title: filteredData[index].title,
            imageUrl: filteredData[index].imageUrl,
            program: filteredData[index].program,
            details: filteredData[index].details,
            price: filteredData[index].price,
            url:filteredData[index].url,
          );
        },
        itemCount: filteredData.length,
      ),
    );
  }
}
