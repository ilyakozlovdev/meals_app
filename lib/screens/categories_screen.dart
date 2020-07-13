import 'package:flutter/material.dart';

import '../services/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JMeals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                color: categoryData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
