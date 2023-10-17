import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rola_app/services/unsplash_services.dart';

class UnsplashImageRepository {
  UnsplashImageRepository();
  final _services = UnsplashServices();

  Future<List?> getImages({String searchKeyWord = "", int perPage = 10}) async {
    var wordWithoutSpace = searchKeyWord.replaceAll(' ', '-');
    if (searchKeyWord == "VR" || searchKeyWord == "vr") {
      wordWithoutSpace = 'virtual-reality';
    }
    try {
      final response = await _services.api.get(
          "/search/photos?page=1&query=$wordWithoutSpace&per_page=$perPage");
      return response.data['results'];
    } on DioException {
      log('Error');
    } catch (e) {
      log('catch this $e');
      rethrow;
    }
    return null;
  }
}
