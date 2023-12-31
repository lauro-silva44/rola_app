import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rola_app/config/routes/routes_location.dart';

import '../../services/authentication.dart';
import '../../styles/images.dart';
import '../../widget/gradient_button.dart';
import '../../widget/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

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
                  InputField(
                    labelText: 'Email address or Mobile Number',
                    controller: _email,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputField(
                    obscureText: true,
                    labelText: 'Password',
                    controller: _password,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RolaGradientButton(
                    label: 'Login',
                    onTap: () async =>
                        await _authService.signInWithEmailAndPassword(
                      emailAddress: _email.text.trim(),
                      password: _password.text.trim(),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
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
                  RolaGradientButton(
                    icon: SvgPicture.asset(SvgAssets.googleLogo),
                    isOutlined: true,
                    label: 'Continue with Google',
                    onTap: () => _authService.signInWithGoogle(),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  RolaGradientButton(
                    icon: SvgPicture.asset(SvgAssets.faceLogo),
                    isOutlined: true,
                    label: 'Continue with Facebook',
                    onTap: () {},
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        context.push(AppRoutes.signup);
                      },
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
