import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rola_app/services/unsplash_services.dart';

class UnsplashImageRepository {
  UnsplashImageRepository();
  final _services = UnsplashServices();

  Future<List?> getImages() async {
    try {
      final response = await _services.api
          .get("/search/photos?page=1&query=virtual-reality&count=10");
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
