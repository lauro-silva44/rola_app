import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes.dart';
import 'package:rola_app/config/routes/routes_location.dart';

import '../firebase_options.dart';

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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const ProviderScope(child: RolaApp()));
  }
}

class RolaApp extends StatelessWidget {
  const RolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        scaffoldBackgroundColor: kColorScheme.background,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      routerConfig:
          GoRouter(initialLocation: AppRoutes.profile, routes: routes),
    );
  }
}
