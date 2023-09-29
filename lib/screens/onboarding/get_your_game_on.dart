import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/styles/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/measures.dart';
import '../../widget/gradient_button.dart';

class GetYourGameOnScreen extends StatelessWidget {
  const GetYourGameOnScreen({super.key, required this.smoothPageIndicator});
  final SmoothPageIndicator smoothPageIndicator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                PngAssets.manPlayingFootball,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultHorizontalPadding),
                  child: Column(
                    children: [
                      SvgPicture.asset(SvgAssets.rolaLogoFullWhite),
                      const SizedBox(
                        height: 32,
                      ),
                      smoothPageIndicator,
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Get your game on',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        'Book sports venues in seconds',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 46,
                        ),
                        child: Text(
                          'Windows talking painted pasture yet its express parties use. Sure last upon he same as knew next. Of believed or diverted no rejoiced.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: defaultHorizontalPadding),
                        child: RolaGradientButton(
                            changeToWhite: true, label: 'Skip On-boarding'),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
