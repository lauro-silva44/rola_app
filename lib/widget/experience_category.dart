import 'package:flutter/material.dart';
import 'package:rola_app/models/activity.dart';

class ExperienceCategory extends StatelessWidget {
  const ExperienceCategory({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 246,
            width: 200,
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
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w900),
          ),
          Text("${activity.venues} Venues",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.grey,
                  )),
        ],
      ),
    );
  }
}
