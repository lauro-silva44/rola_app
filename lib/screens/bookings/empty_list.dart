import 'package:flutter/material.dart';

import '../../models/popular.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../styles/images.dart';
import '../../widget/bottom_navigation_bar.dart';
import '../../widget/filed_button_list.dart';
import '../../widget/gradient_button.dart';
import '../../widget/popular_card.dart';

class EmptyBookingScreen extends StatefulWidget {
  const EmptyBookingScreen({super.key});

  @override
  State<EmptyBookingScreen> createState() => _EmptyBookingScreenState();
}

class _EmptyBookingScreenState extends State<EmptyBookingScreen> {
  String backgroundImagePath =
      'https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MTE5MTJ8MHwxfHNlYXJjaHwxfHxnYW1pbmctY2hhbXBpb25zaGlwLW5lb258ZW58MHx8fHwxNjk3ODAzMDk4fDA&ixlib=rb-4.0.3&q=80&w=400';
  List<Popular> _popularList = [];

  final _timeChips = [
    ['Featured', true],
    ['With friends', false],
    ['Solo play', false],
  ];

  Future<void> populateList() async {
    final imageRepository = await UnsplashImageRepository()
        .getImages(searchKeyWord: 'court sport', perPage: 4);
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
    });
  }

  @override
  void initState() {
    super.initState();
    populateList();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme themeStyle = Theme.of(context).textTheme;
    return Scaffold(
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
                  RolaFilledListButton(
                    list: _timeChips,
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
  }
}
