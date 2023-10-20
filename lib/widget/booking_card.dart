import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';

import '../models/popular.dart';
import '../screens/categories/sub_category.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.category});
  final Popular category;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox.square(
              dimension: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    category.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '12 venues',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            context.push(RoutesLocation.bookingDetails);
          },
          icon: SizedBox.square(
            dimension: 16,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ),
        )
      ],
    );
  }
}
