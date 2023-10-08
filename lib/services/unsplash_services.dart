import 'package:dio/dio.dart';
import 'package:rola_app/config/config.dart';

class UnsplashServices {
  final Dio api = Dio();
  UnsplashServices({String apiBaseUrl = ''}) {
    api.options.baseUrl = Config.unsplashApiAddress + apiBaseUrl;
    api.options.validateStatus = (status) => status! <= 201;
    api.options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Client-ID ${Config.unsplashAccessKey}'
    });
  }
}
