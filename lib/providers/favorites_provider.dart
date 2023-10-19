import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/popular.dart';

class FavoriteProvider extends StateNotifier<List<Popular>> {
  FavoriteProvider() : super([]);
  void addPopular(Popular popular) {
    bool isAlreadyAdded = state.contains(popular);
    if (isAlreadyAdded) {
      state = state
          .where((element) =>
              element.id != popular.id ||
              element.imagePath != popular.imagePath)
          .toList();
    } else {
      state = [...state, popular];
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteProvider, List<Popular>>(
  (ref) => FavoriteProvider(),
);
