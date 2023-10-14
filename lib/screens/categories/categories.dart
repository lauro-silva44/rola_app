import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/data/categories_data.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';
import 'package:rola_app/widget/category_card.dart';
import 'package:rola_app/widget/gradient_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
              shape: const MaterialStatePropertyAll(CircleBorder()),
              backgroundColor: MaterialStatePropertyAll(ColorSystem.black90)),
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Categories',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 450,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          PngAssets.largeBanner,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          Text(
                            'Fitness\nFirst',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 36),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Explore curated experiences for \n your healthy lifestyle',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 170,
                            child: RolaGradientButton(
                              label: 'Explore',
                              changeToWhite: true,
                              onTap: () => context.push(RoutesLocation.search),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${categories.length} Categories',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ),
                ...categories
                    .map((category) => CategoryCard(category: category))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
