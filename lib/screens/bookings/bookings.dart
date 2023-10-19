import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rola_app/providers/favorites_provider.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';
import 'package:rola_app/widget/gradient_button.dart';

import '../../models/popular.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../styles/colors.dart';
import '../../widget/popular_card.dart';
import '../categories/sub_category.dart';

class BookingsScreen extends ConsumerStatefulWidget {
  const BookingsScreen({super.key});

  @override
  ConsumerState<BookingsScreen> createState() => _State();
}

class _State extends ConsumerState<BookingsScreen> {
  String backgroundImagePath = '';
  List<Popular> _popularList = [];

  final _timeChips = [
    ['Featured', true],
    ['With friends', false],
    ['Solo play', false],
  ];
  @override
  void initState() {
    super.initState();
    populateList();
  }

  Future<void> populateList() async {
    final imageRepository = await UnsplashImageRepository()
        .getImages(searchKeyWord: 'court sport', perPage: 4);
    final secondCall = await UnsplashImageRepository()
        .getImages(searchKeyWord: 'gaming championship neon', perPage: 1);
    setState(() {
      _popularList = imageRepository!
          .map(
            (image) => Popular(
                name: image['description'] ?? 'sports',
                imagePath: image['urls']['small'],
                entryPrice: 1.5,
                sport: image['tags'][0]['title'] ?? '',
                isFavorite: false,
                distance: 1.5,
                rate: 4.8),
          )
          .toList();
      backgroundImagePath = secondCall!.first['urls']['small'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var favorites = ref.watch(favoriteProvider);
    TextTheme themeStyle = Theme.of(context).textTheme;
    var content = Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              PngAssets.noBookingBanner,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Looks like you don’t have any bookings..',
                    style:
                        themeStyle.bodyLarge!.copyWith(fontSize: 36, height: 1),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Check out some of these exciting activities to get you started',
                    style: themeStyle.bodyLarge!
                        .copyWith(fontSize: 18, color: Colors.grey.shade400),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Popular near you',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: _timeChips
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FilledButton(
                              style: TextButton.styleFrom(
                                backgroundColor: e[1] as bool
                                    ? Colors.white
                                    : Colors.grey.shade700,
                              ),
                              child: Text(
                                e[0] as String,
                                style: TextStyle(
                                  color: e[1] as bool
                                      ? ColorSystem.black
                                      : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                e[1] = !(e[1] as bool);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            backgroundImagePath,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 32,
                        left: 32,
                        bottom: 32,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Brand New'),
                            Text(
                              'Connect with All-\nStar Players',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const SizedBox(
                              width: 145,
                              child: RolaGradientButton(label: 'Explore'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );

    if (favorites.isNotEmpty) {
      var category = favorites.first;

      content = Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox.square(
                    dimension: 122,
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
                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      Text(
                        '12 venues',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => SubCategoryScreen(
                        title: category.name,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
              )
            ],
          ),
        )),
        bottomNavigationBar: const RolaBottomNavigationBar(),
      );
    }
    return content;
  }
}
