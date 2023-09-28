import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rola_app/screens/login/forgot_password.dart';

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
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: kColorScheme.background,
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const ForgotPasswordScreen(),
    );
  }
}
