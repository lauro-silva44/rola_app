import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rola_app/styles/images.dart';
import 'package:rola_app/widget/gradient_button.dart';

import '../../constants/measures.dart';
import '../../widget/otp_input_field.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onChanged(String otpValue) {
      if (otpValue.length == 1) {
        FocusScope.of(context).nextFocus();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(SvgAssets.rolaLogo),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 21),
                child: Text(
                  'Verification Code Sent',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Text(
                'A 6 digit verification code has been sent to your\n registered phone number and email address.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OptInputField(onChanged: onChanged),
                    OptInputField(onChanged: onChanged),
                    OptInputField(onChanged: onChanged),
                    const SizedBox(
                      width: 7,
                    ),
                    OptInputField(onChanged: onChanged),
                    OptInputField(onChanged: onChanged),
                    OptInputField(onChanged: (otp6) {}),
                  ],
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Haven’t received a code?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              const RolaGradientButton(
                label: 'Resend Code',
                suffixIcon: Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
    );
  }
}
