import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rola_app/services/unsplash_services.dart';

class UnsplashImageRepository {
  UnsplashImageRepository();
  final _services = UnsplashServices();

  Future getImages() async {
    try {
      final result = await _services.api
          .get("/search/photos?page=1&query=virtual-reality");

      log(result.toString());
    } on DioException {
      log('Error');
    } catch (e) {
      log('catch this $e');
      rethrow;
    }
  }
}
