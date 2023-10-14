import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/models/popular.dart';

import '../styles/colors.dart';

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key, required this.info, this.isNetWorkingImage = false});
  final Popular info;
  final bool isNetWorkingImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RoutesLocation.details, extra: info),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 159,
                height: 152,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: isNetWorkingImage
                      ? Hero(
                          tag: info.imagePath,
                          child: Image.network(
                            info.imagePath,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          info.imagePath,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                top: 8,
                right: 16,
                child: SizedBox.square(
                  dimension: 22,
                  child: IconButton(
                    icon: Icon(
                      info.isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(info.isFavorite),
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
          SizedBox(
            width: 159,
            child: Text(
              info.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '\$${info.entryPrice} / entry',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            info.sport,
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
                '${info.distance} kms away',
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
                '${info.rate} ',
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
      ),
    );
  }
}
