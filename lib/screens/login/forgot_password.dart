import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                PngAssets.manWithGlassesVirtual,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultHorizontalPadding),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 84, bottom: 39),
                      child: SvgPicture.asset(SvgAssets.rolaLogoFullWhite),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 213),
                      child: Text(
                        'The ultimate\n event booking app',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                    Text(
                      'SIGNUP',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    const InputField(
                      labelText: 'Email address or Mobile Number',
                      changeContrast: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: InputField(
                        labelText: 'Password',
                        changeContrast: true,
                        obscureText: true,
                      ),
                    ),
                    const InputField(
                      labelText: 'Confirm Password',
                      changeContrast: true,
                      obscureText: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: RolaGradientButton(label: 'Sign up'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
