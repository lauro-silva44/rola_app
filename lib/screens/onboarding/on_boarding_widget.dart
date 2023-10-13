import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/measures.dart';
import '../../styles/images.dart';

final List<Widget> content = [
  onBoardingContent(
    title: 'Book in seconds',
    svgImagePath: SvgAssets.bookInSeconds,
    paddingTop: 118,
    paddingBottom: 68,
  ),
  onBoardingContent(
      title: 'Rate, Review, Rewards',
      svgImagePath: SvgAssets.rateReviewRewards,
      paddingTop: 76,
      paddingBottom: 54),
  onBoardingContent(
      title: 'Invite Friends',
      svgImagePath: SvgAssets.inviteFriends,
      paddingTop: 0,
      paddingBottom: 0),
];

Widget onBoardingContent(
    {required String title,
    required String svgImagePath,
    required double paddingTop,
    required double paddingBottom}) {
  const manrope = TextStyle(
    fontFamily: 'Manrope',
  );

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
        child: SvgPicture.asset(svgImagePath),
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: manrope.copyWith(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
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
          style: manrope.copyWith(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
