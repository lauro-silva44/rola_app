import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  Config._();
  static String get pexelsKey => _get('PEXELS_API_KEY');
  static String _get(String name) => dotenv.env[name] ?? '';
}
