import 'package:rola_app/styles/images.dart';

import '../models/activity.dart';
import '../models/popular.dart';

final List<Activity> activities = [
  Activity(name: 'VR', imagePath: PngAssets.manWithGlassesVirtual, venues: 34),
  Activity(name: 'Arcade Gaming', imagePath: PngAssets.arcadeGames, venues: 65),
  Activity(name: 'Fitness', imagePath: PngAssets.fitness, venues: 94),
];

final List<Popular> popularActivities = [
  Popular(
      imagePath: PngAssets.skate,
      name: 'Skate Stuff',
      entryPrice: 15,
      sport: 'Skateboarding',
      distance: 1.5,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.streetBasket,
      name: 'Court 34',
      entryPrice: 15,
      sport: 'Basketball',
      distance: 1.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.manMedicineBall,
      name: 'X-FIT',
      entryPrice: 15,
      sport: 'Crossfit',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.yoga,
      name: 'Yoga for 2',
      entryPrice: 15,
      sport: 'Yoga.Spa ',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.basketBlack,
      name: 'Golden Gate Activity Center',
      entryPrice: 15,
      sport: 'Basketball',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.snowboarding,
      name: 'Snowflake Experience',
      entryPrice: 15,
      sport: 'Snowboarding',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.basketOrange,
      name: 'Court 96',
      entryPrice: 15,
      sport: 'Basketball',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
  Popular(
      imagePath: PngAssets.vrRealm,
      name: 'VR Realm 247',
      entryPrice: 15,
      sport: 'Virtual Reality',
      distance: 2.3,
      rate: 4.8,
      isFavorite: false),
];
