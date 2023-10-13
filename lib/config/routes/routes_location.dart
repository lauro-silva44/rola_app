import 'package:flutter/foundation.dart' show immutable;

@immutable
class RoutesLocation {
  const RoutesLocation._();

  static String get home => '/';
  static String get login => '/login';
  static String get signup => '/signup';
  static String get onBoarding => '/on_boarding';
  static String get explore => '/explore';
  static String get subCategory => '/sub_category';
}
