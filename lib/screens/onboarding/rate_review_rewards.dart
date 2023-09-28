import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/styles/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/gradient_button.dart';

class RateReviewScreen extends StatelessWidget {
  const RateReviewScreen({
    super.key,
    required this.smoothPageIndicator,
  });
  final SmoothPageIndicator smoothPageIndicator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(SvgAssets.rolaLogo),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: defaultHorizontalPadding),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 76, bottom: 54),
              child: SvgPicture.asset(SvgAssets.rateReviewRewards),
            ),
            Text(
              'Rate, Review, Rewards',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 100,
                  right: defaultHorizontalPadding,
                  left: defaultHorizontalPadding),
              child: Text(
                'Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            smoothPageIndicator,
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
              child: RolaGradientButton(label: 'Skip On-boarding'),
            )
          ],
        ),
      ),
    );
  }
}
