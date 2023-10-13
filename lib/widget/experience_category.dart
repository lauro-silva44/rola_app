import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rola_app/models/activity.dart';

class ExperienceCategory extends StatelessWidget {
  const ExperienceCategory(
      {super.key,
      required this.activity,
      this.imageHeight,
      this.imageWidth,
      this.showVenues = true,
      this.onTap});
  final double? imageHeight;
  final double? imageWidth;
  final bool showVenues;
  final Activity activity;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap == null
            ? () {}
            : () {
                onTap!(activity.name);
              },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight ?? 246,
              width: imageWidth ?? 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  activity.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              activity.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: showVenues ? null : 18),
            ),
            if (showVenues)
              Text("${activity.venues} Venues",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey,
                      )),
          ],
        ),
      ),
    );
  }
}
