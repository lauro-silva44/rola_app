import 'package:flutter/material.dart';

import '../styles/colors.dart';

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key,
      required this.imagePath,
      required this.isFavorite,
      required this.name});
  final String imagePath;
  final bool isFavorite;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 159,
              height: 152,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 32,
              child: SizedBox.square(
                dimension: 22,
                child: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => RotationTransition(
                      turns:
                          Tween<double>(begin: 0.8, end: 1).animate(animation),
                      child: child,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(isFavorite),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '\$15 / entry',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Skateboarding',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '1.5 kms away',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
            Text(
              '  •  ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Text(
              '4.8 ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorSystem.teal,
                  ),
            ),
            Icon(
              Icons.star,
              color: ColorSystem.teal,
            )
          ],
        )
      ],
    );
  }
}
