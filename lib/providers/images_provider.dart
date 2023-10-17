import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/popular.dart';
import '../repositories/unsplash_images.repository.dart';

class ImageFromUnsplashProvider extends StateNotifier<List<Popular>> {
  ImageFromUnsplashProvider() : super([]);
  Future<void> popular({String searchKey = 'sport', int perPage = 10}) async {
    final imageRepository = await UnsplashImageRepository()
        .getImages(searchKeyWord: searchKey, perPage: perPage);
    List<Popular> list = imageRepository!
        .map(
          (image) => Popular(
              name: image['description'] ?? searchKey,
              imagePath: image['urls']['small'],
              entryPrice: 1.5,
              sport: image['tags'][0]['title'] ?? '',
              isFavorite: false,
              distance: 1.5,
              rate: 4.8),
        )
        .toList();
    state = [...list];
  }
}

final imageProvider =
    StateNotifierProvider<ImageFromUnsplashProvider, List<Popular>>(
  (ref) => ImageFromUnsplashProvider(),
);
