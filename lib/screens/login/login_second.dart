import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

import '../../constants/measures.dart';
import '../../services/firebase_firestore.dart';

class LoginSecondScreen extends StatefulWidget {
  const LoginSecondScreen({super.key});

  @override
  State<LoginSecondScreen> createState() => _LoginSecondScreenState();
}

class _LoginSecondScreenState extends State<LoginSecondScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FireStoreService _fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  PngAssets.backgroundLayingOnTheFloor,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: 30,
                    child: SvgPicture.asset(SvgAssets.rolaLogoFullWhite))
              ],
            ),
            Text(
              'The ultimate event \n booking app',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 31,
            ),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultHorizontalPadding),
              child: Column(
                children: [
                  InputField(
                    labelText: 'Email address or Mobile Number',
                    controller: _email,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    controller: _password,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  RolaGradientButton(
                    label: 'Login',
                    onTap: () async {
                      final user = await _fireStoreService.login(
                        email: _email.text.trim(),
                        password: _password.text.trim(),
                      );

                      if (user != null && mounted) {
                        context.push(AppRoutes.onBoarding);
                      } else {
                        log(user.toString());
                        return;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Don’t have an account? Sign up',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
