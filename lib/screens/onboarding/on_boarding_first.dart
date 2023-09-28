import 'package:flutter/material.dart';
import 'package:rola_app/screens/onboarding/book_in_seconds.dart';
import 'package:rola_app/screens/onboarding/get_your_game_on.dart';
import 'package:rola_app/screens/onboarding/invite_friends.dart';
import 'package:rola_app/screens/onboarding/rate_review_rewards.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  SmoothPageIndicator get smoothPageIndicator {
    return SmoothPageIndicator(
      controller: _controller,
      count: 4,
      effect: WormEffect(
        activeDotColor: ColorSystem.teal,
        dotColor: Colors.white,
        dotHeight: 8,
        dotWidth: 8,
        type: WormType.thinUnderground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      BookInSecondsScreen(smoothPageIndicator: smoothPageIndicator),
      InviteFriendsScreen(smoothPageIndicator: smoothPageIndicator),
      RateReviewScreen(smoothPageIndicator: smoothPageIndicator),
      GetYourGameOnScreen(smoothPageIndicator: smoothPageIndicator),
    ];
    return Scaffold(
      body: PageView(controller: _controller, children: pages),
    );
  }
}
