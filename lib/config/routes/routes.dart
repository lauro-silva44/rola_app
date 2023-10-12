import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/screens/login/login_second.dart';
import 'package:rola_app/screens/signup/signup.dart';

import '../../screens/home/home.dart';
import '../../screens/signup/simple_signup.dart';

final routes = [
  GoRoute(
    path: RoutesLocation.home,
    name: RoutesLocation.home,
    builder: (ctx, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RoutesLocation.signup,
    builder: (ctx, state) => const SimpleSignUpScreen(),
  ),
  GoRoute(
    path: RoutesLocation.login,
    builder: (ctx, state) => const LoginSecondScreen(),
  ),
];
