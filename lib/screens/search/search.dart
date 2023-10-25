import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/models/popular.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';
import 'package:rola_app/widget/popular_card.dart';

import '../../data/dummy_data.dart';
import '../../providers/favorites_provider.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../styles/colors.dart';
import '../../styles/images.dart';
import '../../widget/experience_category.dart';
import '../categories/sub_category.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  List<Popular> _imageList = [];
  final _exploreList = List.from(activities);
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  initState() {
    super.initState();

    populateList();
  }

  Future<void> populateList({String searchKey = 'yoga'}) async {
    final imageRepository =
        await UnsplashImageRepository().getImages(searchKeyWord: searchKey);
    setState(() {
      _imageList = imageRepository!.map((image) {
        bool noAddedYet = ref
            .watch(favoriteProvider)
            .where((element) => element.imagePath == image['urls']['small'])
            .isEmpty;
        return Popular(
            name: image['description'] ?? searchKey,
            imagePath: image['urls']['small'],
            entryPrice: 1.5,
            sport: image['tags'][0]['title'] ?? '',
            isFavorite: noAddedYet,
            distance: 1.5,
            rate: 4.8);
      }).toList();
    });
  }

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
            controller: _searchFieldController,
            onChanged: (value) => populateList(searchKey: value),
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
                    activity: _exploreList[index],
                    onTap: (title) =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => SubCategoryScreen(
                        title: title,
                      ),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  '${_imageList.length} Venues Related to ‘${_searchFieldController.text.isEmpty ? 'yoga' : _searchFieldController.text}’',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16),
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 20,
                  runSpacing: 10, // gap between adjacent chips
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
