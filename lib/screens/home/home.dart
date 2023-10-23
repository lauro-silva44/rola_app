import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

import '../../constants/measures.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  PngAssets.manLayingPlaying,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 30,
                  child: Column(
                    children: [
                      SvgPicture.asset(SvgAssets.rolaLogoFullWhite),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'The ultimate experience booking app',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultHorizontalPadding),
                        child: Column(
                          children: [
                            RolaGradientButton(
                                label: 'Sign up',
                                changeToWhite: true,
                                onTap: () => context.push(AppRoutes.signup)),
                            const SizedBox(
                              height: 16,
                            ),
                            RolaGradientButton(
                              label: 'Login',
                              onTap: () => context.push(AppRoutes.login),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
