import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/providers/favorites_provider.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';

import '../../styles/colors.dart';
import '../../styles/images.dart';
import '../../widget/popular_card.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favorites = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(ColorSystem.black90),
          ),
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: SearchBar(
            elevation: const MaterialStatePropertyAll(0),
            textStyle: MaterialStatePropertyAll(
              Theme.of(context).textTheme.bodyMedium!,
            ),
            trailing: [
              SvgPicture.asset(
                SvgAssets.searchAlt,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )
            ],
            hintText: 'what are you looking for?',
            hintStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.bodyMedium!),
            backgroundColor: MaterialStateProperty.all(ColorSystem.black90),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.tune_rounded,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '${favorites.length} Favorites',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorSystem.black40,
                        fontSize: 24,
                      ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  runSpacing: 16,
                  children: favorites
                      .map((e) => SizedBox(
                            width: 159,
                            child: PopularCard(
                              isNetWorkingImage: true,
                              info: e,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
