import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

import '../../constants/measures.dart';

class LoginSecondScreen extends StatelessWidget {
  const LoginSecondScreen({super.key});

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
                  const InputField(labelText: 'Email address or Mobile Number'),
                  const SizedBox(
                    height: 8,
                  ),
                  const InputField(
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const RolaGradientButton(label: 'Login'),
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
