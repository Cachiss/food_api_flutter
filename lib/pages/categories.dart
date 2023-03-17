import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildCategoryItem(context, 'assets/images/beef.jpeg', 'Beef'),
            _buildCategoryItem(
                context, 'assets/images/breakfast.jpg', 'Breakfast'),
            _buildCategoryItem(context, 'assets/images/pasta.png', 'Pasta'),
            _buildCategoryItem(context, 'assets/images/seafood.jpg', 'Seafood'),
          ],
        ));
  }

  Widget _buildCategoryItem(
      BuildContext context, String image, String category) {
    return Container(
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'food_by_category',
                arguments: category);
          },
          child: Column(
            children: [
              Image.asset(image, width: 150, height: 150),
              Text(category),
            ],
          ),
        ),
      ),
    );
  }
}
