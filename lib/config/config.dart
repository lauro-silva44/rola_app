import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  Config._();
  static String get unsplashApiAddress => _get('UNSPLASH_API_ADDRESS');
  static String get unsplashAccessKey => _get('UNSPLASH_ACCESS_KEY');
  static String get unsplashSecretKey => _get('UNSPLASH_SECRET_KEY');
  static String _get(String name) => dotenv.env[name] ?? '';
}
