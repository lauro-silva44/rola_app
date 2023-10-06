import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/models/popular.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';
import 'package:rola_app/widget/popular_card.dart';

import '../../data/dummy_data.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../styles/colors.dart';
import '../../styles/images.dart';
import '../../widget/experience_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Popular> _imageList = [];

  @override
  initState() {
    super.initState();

    populateList();
  }

  Future<void> populateList() async {
    final imageRepository =
        await UnsplashImageRepository().getImages(searchKeyWord: 'yoga');
    setState(() {
      _imageList = imageRepository!
          .map(
            (image) => Popular(
                name: image['description'] ?? '',
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

  final _exploreList = List.from(activities);
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Explore',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _exploreList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ExperienceCategory(
                          imageHeight: 118,
                          imageWidth: 150,
                          showVenues: false,
                          activity: _exploreList[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '${_imageList.length} Venues Related to ‘Yoga’',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16),
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 20, // gap between adjacent chips
                  children: _imageList
                      .map((e) => SizedBox(
                            width: 159,
                            child: PopularCard(
                              info: e,
                              isNetWorkingImage: true,
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
