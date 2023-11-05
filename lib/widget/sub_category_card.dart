import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/models/popular.dart';
import 'package:transparent_image/transparent_image.dart';

import '../providers/favorites_provider.dart';

class SubCategoryCard extends ConsumerWidget {
  const SubCategoryCard({super.key, required this.info});
  final Popular info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref
        .watch(favoriteProvider)
        .where((element) => element.imagePath == info.imagePath)
        .isNotEmpty;
    return InkWell(
      onTap: () => context.push(AppRoutes.details, extra: info),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 260,
              child: Stack(
                children: [
                  Hero(
                    tag: info.imagePath,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: info.imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        )),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        key: ValueKey(isFavorite),
                      ),
                      onPressed: () {
                        ref.read(favoriteProvider.notifier).addPopular(info);
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                    info.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  '\$${info.entryPrice} / entry',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              info.sport,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '${info.distance} kms away',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
