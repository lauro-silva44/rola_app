import 'package:flutter/material.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';
import 'package:rola_app/widget/sub_category_card.dart';

import '../../models/category.dart';
import '../../repositories/unsplash_images.repository.dart';
import '../../styles/colors.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key, required this.title});
  final String title;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategoryScreen> {
  List<Category> _imageList = [];
  final List<String> _chipList = [
    'Featured',
    'Recently Added',
    'Visited',
    'Discounts'
  ];

  @override
  void initState() {
    super.initState();
    populateList();
  }

  Future<void> populateList() async {
    final imageRepository =
        await UnsplashImageRepository().getImages(searchKeyWord: widget.title);
    setState(() {
      _imageList = imageRepository!
          .map((image) => Category(
                imageSrc: image['urls']['small'],
                description: image['alt_description'] ?? 'No description',
                tag: image['tags'].first['title'],
              ))
          .toList();
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
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w900),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _chipList.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Chip(
                      backgroundColor: _chipList[index] == 'Featured'
                          ? Colors.white
                          : ColorSystem.black90,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      label: Text(
                        _chipList[index],
                        style: TextStyle(
                          color: _chipList[index] == 'Featured'
                              ? ColorSystem.black90
                              : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              ..._imageList
                  .map(
                    (category) => SubCategoryCard(category: category),
                  )
                  .toList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
