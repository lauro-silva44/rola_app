import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../screens/categories/categories.dart';
import '../screens/details/details.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  background: const Color.fromARGB(255, 22, 37, 52),
  seedColor: const Color.fromARGB(255, 22, 37, 52),
);

class Env {
  Env() {
    to = this;
    main();
  }

  static Env? to;
  String? baseApiUrl;

  void main() async {
    await dotenv.load(fileName: '.env');
    runApp(const RolaApp());
  }
}

class RolaApp extends StatelessWidget {
  const RolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        scaffoldBackgroundColor: kColorScheme.background,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const DetailsScreen(),
    );
  }
}
