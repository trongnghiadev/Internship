import 'package:flutter/material.dart';
import 'package:login_2/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Category color;
  const CategoryCard({super.key, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Text(Category.name),
            // Text(data)
          ],
        ),
      ),
    );
  }
}
