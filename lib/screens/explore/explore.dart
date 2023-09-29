import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  double _imageSizeHeight = 0.0;
  Image _image = Image.asset(PngAssets.snowboarding);
  @override
  void initState() {
    super.initState();

    _image.image.resolve(const ImageConfiguration()).addListener(
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(_imageSizeHeight),
          child: AppBar(
            title: Text('Title'),
            flexibleSpace: Stack(
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
                              .titleLarge!
                              .copyWith(
                                fontSize: 36,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
        body: Column());
  }
}
