import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/data/dummy_data.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';

import '../../models/activity.dart';
import '../../models/popular.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../widget/bottom_navigation_bar.dart';
import '../../widget/experience_category.dart';
import '../../widget/popular_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  double _imageSizeHeight = 0.0;
  final List<Activity> _exploreList = List.from(activities);
  List<Popular> _popularList = [];
  Image image = Image.asset(PngAssets.snowboarding);

  @override
  void initState() {
    super.initState();

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          setState(() {
            _imageSizeHeight = info.image.height.toDouble();
          });
        },
      ),
    );

    populateList();
  }

  Future<void> populateList({String searchKey = 'sports'}) async {
    final imageRepository =
        await UnsplashImageRepository().getImages(searchKeyWord: searchKey);
    setState(() {
      _popularList = imageRepository!
          .map(
            (image) => Popular(
                name: image['description'] ?? searchKey,
                imagePath: image['urls']['small'],
                entryPrice: 1.5,
                sport: image['tags'][0]['title'] ?? '',
                isFavorite: false,
                distance: 1.5,
                rate: 4.8),
          )
          .toList();
    });
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
                elevation: const MaterialStatePropertyAll(0),
                textStyle: MaterialStatePropertyAll(
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorSystem.black),
                ),
                onChanged: (searchKeyWord) {
                  populateList(searchKey: searchKeyWord);
                },
                trailing: [SvgPicture.asset(SvgAssets.searchAlt)],
                hintText: 'what are you looking for?',
                hintStyle: MaterialStatePropertyAll(Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorSystem.black40)),
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
                          SizedBox(
                            width: 180,
                            child: RolaGradientButton(
                              label: 'Explore',
                              changeToWhite: true,
                              onTap: () =>
                                  context.push(RoutesLocation.category),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _exploreList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ExperienceCategory(
                    activity: _exploreList[index],
                    onTap: (name) =>
                        context.push(RoutesLocation.subCategory, extra: name),
                  ),
                ),
              ),
              sectionTitle('Popular near you'),
              Wrap(
                alignment: WrapAlignment.center,

                spacing: 48, // gap between adjacent chips
                runSpacing: 24,
                children: _popularList
                    .map(
                      (popular) => SizedBox(
                        width: 159,
                        child: PopularCard(
                          isNetWorkingImage: true,
                          info: popular,
                        ),
                      ),
                    )
                    .toList(),
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
                            SizedBox(
                              width: 180,
                              child: RolaGradientButton(
                                label: 'Learn More',
                                changeToWhite: true,
                                onTap: () =>
                                    context.push(RoutesLocation.category),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
