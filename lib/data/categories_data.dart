import 'package:rola_app/styles/images.dart';

import '../models/activity.dart';
import 'dummy_data.dart';

final List<Activity> categories = [
  ...activities,
  Activity(name: 'Skateboarding', imagePath: PngAssets.skate, venues: 348),
  Activity(
      name: 'SnowBoarding', imagePath: PngAssets.snowboarding, venues: 348),
  Activity(name: 'CrossFit', imagePath: PngAssets.manMedicineBall, venues: 348),
  Activity(name: 'Basketball', imagePath: PngAssets.basketBlack, venues: 348),
  Activity(name: 'Yoga', imagePath: PngAssets.yoga, venues: 348),
];
