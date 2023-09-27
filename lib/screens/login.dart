import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/svg/images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [SvgPicture.asset(SvgAssets.rolaLogo), Text("somethe")],
        ),
      ),
    );
  }
}
