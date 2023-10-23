import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/screens/onboarding/book_in_seconds.dart';
import 'package:rola_app/screens/onboarding/get_your_game_on.dart';
import 'package:rola_app/screens/onboarding/invite_friends.dart';
import 'package:rola_app/screens/onboarding/on_boarding_widget.dart';
import 'package:rola_app/screens/onboarding/rate_review_rewards.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/measures.dart';
import '../../styles/images.dart';
import '../../widget/gradient_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  final List<Widget> _pages = content;
  @override
  void initState() {
    super.initState();
  }

  SmoothPageIndicator get smoothPageIndicator {
    return SmoothPageIndicator(
      controller: _controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: ColorSystem.teal,
        dotColor: Colors.white,
        dotHeight: 8,
        dotWidth: 8,
        type: WormType.normal,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget presentation;

    presentation = Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(SvgAssets.rolaLogo),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: defaultHorizontalPadding),
            child: IconButton(
              onPressed: () {
                context.push(AppRoutes.explore);
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ],
      ),
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: _pages,
              ),
            ),
            smoothPageIndicator,
            Padding(
              padding: const EdgeInsets.only(bottom: 41, top: 32),
              child: RolaGradientButton(
                label: 'Skip On-boarding',
                onTap: () => context.push(AppRoutes.explore),
              ),
            )
          ],
        ),
      ),
    );

    return presentation;
  }
}
