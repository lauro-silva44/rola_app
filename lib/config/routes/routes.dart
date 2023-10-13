import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/screens/login/login_second.dart';
import 'package:rola_app/screens/onboarding/on_boarding_first.dart';
import 'package:rola_app/screens/signup/signup.dart';

import '../../screens/categories/sub_category.dart';
import '../../screens/explore/explore.dart';
import '../../screens/home/home.dart';

final routes = [
  GoRoute(
    path: RoutesLocation.home,
    name: RoutesLocation.home,
    builder: (ctx, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RoutesLocation.signup,
    builder: (ctx, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: RoutesLocation.login,
    builder: (ctx, state) => const LoginSecondScreen(),
  ),
  GoRoute(
    path: RoutesLocation.onBoarding,
    builder: (ctx, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: RoutesLocation.explore,
    builder: (ctx, state) => const ExploreScreen(),
  ),
  GoRoute(
    path: RoutesLocation.subCategory,
    builder: (ctx, state) => SubCategoryScreen(
      title: state.extra as String,
    ),
  ),
];
