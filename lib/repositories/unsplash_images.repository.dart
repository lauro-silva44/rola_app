import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rola_app/services/unsplash_services.dart';

class UnsplashImageRepository {
  UnsplashImageRepository();
  final _services = UnsplashServices();

  Future<List?> getImages({String searchKeyWord = ""}) async {
    var wordWithoutSpace = searchKeyWord.replaceAll(' ', '-');
    if (searchKeyWord == "VR" || searchKeyWord == "vr") {
      wordWithoutSpace = 'virtual-reality';
    }
    try {
      final response = await _services.api
          .get("/search/photos?page=1&query=$wordWithoutSpace&count=10");
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
