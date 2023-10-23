import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/popular.dart';

class FavoriteProvider extends StateNotifier<List<Popular>> {
  FavoriteProvider() : super([]);
  void addPopular(Popular popular) {
    bool isAlreadyAdded = state
        .where((element) => element.imagePath == popular.imagePath)
        .isNotEmpty;
    if (isAlreadyAdded) {
      state = state
          .where((element) => element.imagePath != popular.imagePath)
          .toList();
    } else {
      state = [...state, popular];
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteProvider, List<Popular>>(
  (ref) => FavoriteProvider(),
);
