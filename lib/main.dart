import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rola_app/screens/login.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(22, 37, 52, 1),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: kColorScheme.background,
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
