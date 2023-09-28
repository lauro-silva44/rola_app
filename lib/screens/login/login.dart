import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/images.dart';
import '../../widget/gradient_button.dart';
import '../../widget/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: SvgPicture.asset(
                      SvgAssets.rolaLogo,
                      width: 129,
                      height: 47,
                    ),
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const InputField(
                    labelText: 'What are you looking for?',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const InputField(
                    obscureText: true,
                    labelText: 'Password',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const GradientButton(
                    label: 'Login',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: Divider()),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const RadialGradient(
                            center: Alignment.topLeft,
                            radius: 1.0,
                            colors: [
                              Color.fromRGBO(123, 93, 255, 0.8),
                              Color.fromRGBO(0, 136, 239, 0.8),
                              Color.fromRGBO(0, 227, 239, 0.3),
                            ],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GradientButton(
                    icon: SvgPicture.asset(SvgAssets.googleLogo),
                    isOutlined: true,
                    label: 'Continue with Google',
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  GradientButton(
                    icon: SvgPicture.asset(SvgAssets.faceLogo),
                    isOutlined: true,
                    label: 'Continue with Facebook',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text:
                                'By tapping Sign up, Continue with Google, or Continue with Facebook you agree to the',
                            style: TextStyle(height: 2)),
                        TextSpan(
                          text: '\n Terms of Service',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: const Color.fromRGBO(0, 136, 239, 1),
                                  height: 2),
                        ),
                        const TextSpan(text: ' and acknowledge our \n'),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: const Color.fromRGBO(0, 136, 239, 1),
                                  height: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 36,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Don’t have an account? Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                        const SizedBox.square(
                            dimension: 16,
                            child: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
