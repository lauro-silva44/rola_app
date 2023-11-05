import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

import '../../services/firebase_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  final FireStoreService _fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              PngAssets.manWithGlassesVirtual,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 60, horizontal: defaultHorizontalPadding),
              child: Column(
                children: [
                  SizedBox(
                    width: 129,
                    child: SvgPicture.asset(
                      SvgAssets.rolaLogoFullWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'The ultimate\nexperience booking app',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 213,
                  ),
                  Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InputField(
                      controller: _email,
                      changeContrast: true,
                      labelText: 'Email address or Mobile Number'),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                      controller: _password,
                      obscureText: true,
                      changeContrast: true,
                      labelText: 'Password'),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                      controller: _passwordConfirmation,
                      obscureText: true,
                      changeContrast: true,
                      labelText: 'Confirm Password'),
                  const SizedBox(
                    height: 16,
                  ),
                  RolaGradientButton(
                    label: 'Sign up',
                    onTap: () async {
                      log('inside');
                      if (_passwordConfirmation.text.trim() ==
                              _password.text.trim() &&
                          EmailValidator.validate(_email.text.trim())) {
                        await _fireStoreService.createUser(
                            email: _email.text, password: _password.text);
                        log('user created');
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
