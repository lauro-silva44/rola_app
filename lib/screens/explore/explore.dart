import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';

import '../../widget/experience_category.dart';
import '../../widget/popular_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  double _imageSizeHeight = 0.0;
  Image image = Image.asset(PngAssets.snowboarding);

  @override
  void initState() {
    super.initState();

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          setState(() {
            // Update the dimensions once the image is loaded.
            _imageSizeHeight = info.image.height.toDouble();
            log(_imageSizeHeight);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget sectionTitle(String title) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            floating: true,
            leadingWidth: 48,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SvgPicture.asset(
                SvgAssets.rolaLogoWhite,
                fit: BoxFit.contain,
              ),
            ),
            title: SizedBox(
              height: 40,
              child: SearchBar(
                hintText: 'what are you looking for?',
                hintStyle: MaterialStatePropertyAll(Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorSystem.black)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox.square(
                  dimension: 32,
                  child: SvgPicture.asset(SvgAssets.notificationsAlt),
                ),
              )
            ],
            pinned: true,
            expandedHeight: _imageSizeHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    PngAssets.snowboarding,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    bottom: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Text(
                            'Peak jump \nlike a PRO.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 36,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: 180,
                            child: RolaGradientButton(
                              label: 'Explore',
                              changeToWhite: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList.list(
            children: [
              sectionTitle('Explore'),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 310,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ExperienceCategory(
                      imagePath: PngAssets.manWithGlassesVirtual,
                      name: 'VR',
                      venues: 34,
                    ),
                    ExperienceCategory(
                      imagePath: PngAssets.manWithGlassesVirtual,
                      name: 'VR',
                      venues: 34,
                    ),
                    ExperienceCategory(
                      imagePath: PngAssets.manWithGlassesVirtual,
                      name: 'VR',
                      venues: 34,
                    ),
                    ExperienceCategory(
                      imagePath: PngAssets.manWithGlassesVirtual,
                      name: 'VR',
                      venues: 34,
                    ),
                  ],
                ),
              ),
              sectionTitle('Popular near you'),
              Row(
                children: [
                  PopularCard(
                    imagePath: PngAssets.skate,
                    isFavorite: true,
                    name: 'Skate Stuff',
                  ),
                  PopularCard(
                    imagePath: PngAssets.skate,
                    isFavorite: true,
                    name: 'Skate Stuff',
                  ),
                ],
              ),
              Container(
                height: 600,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        PngAssets.girlHoodie,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '70% off on Pro \nworkout gear.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 36,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Exclusive to the ROLA store. Get \nit now while stocks last.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              width: 180,
                              child: RolaGradientButton(
                                label: 'Learn More',
                                changeToWhite: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              sectionTitle('Curated Experiences'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
