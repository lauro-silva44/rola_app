import 'package:flutter/material.dart';
import 'package:rola_app/models/activity.dart';

import '../screens/categories/sub_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Activity category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox.square(
                dimension: 122,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    category.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    '${category.venues} venues',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SubCategoryScreen(
                    title: category.name,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
