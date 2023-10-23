import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/screens/bookings/booking_details.dart';
import 'package:rola_app/screens/bookings/bookings.dart';
import 'package:rola_app/screens/categories/categories.dart';
import 'package:rola_app/screens/details/details.dart';
import 'package:rola_app/screens/login/login_second.dart';
import 'package:rola_app/screens/onboarding/on_boarding_first.dart';
import 'package:rola_app/screens/search/search.dart';
import 'package:rola_app/screens/signup/signup.dart';

import '../../models/popular.dart';
import '../../screens/categories/sub_category.dart';
import '../../screens/explore/explore.dart';
import '../../screens/home/home.dart';

final routes = [
  GoRoute(
    path: AppRoutes.home,
    name: AppRoutes.home,
    builder: (ctx, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRoutes.signup,
    builder: (ctx, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: AppRoutes.login,
    builder: (ctx, state) => const LoginSecondScreen(),
  ),
  GoRoute(
    path: AppRoutes.onBoarding,
    builder: (ctx, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: AppRoutes.explore,
    builder: (ctx, state) => const ExploreScreen(),
  ),
  GoRoute(
    path: AppRoutes.subCategory,
    builder: (ctx, state) => SubCategoryScreen(
      title: state.extra as String,
    ),
  ),
  GoRoute(
    path: AppRoutes.category,
    builder: (ctx, state) => const CategoriesScreen(),
  ),
  GoRoute(
    path: AppRoutes.search,
    builder: (ctx, state) => const SearchScreen(),
  ),
  GoRoute(
    path: AppRoutes.details,
    builder: (ctx, state) => DetailsScreen(
      info: state.extra as Popular,
    ),
  ),
  GoRoute(
    path: AppRoutes.bookings,
    builder: (ctx, state) => const BookingsScreen(),
  ),
  GoRoute(
    path: AppRoutes.bookingDetails,
    builder: (ctx, state) => BookingDetailsScreen(
      info: state.extra as Popular,
    ),
  ),
];
