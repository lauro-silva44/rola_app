import 'package:flutter/material.dart';
import 'package:rola_app/screens/explore/explore.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  background: const Color.fromARGB(255, 22, 37, 52),
  seedColor: const Color.fromARGB(255, 22, 37, 52),
);

void main() {
  runApp(const RolaApp());
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
      home: const ExploreScreen(),
    );
  }
}
