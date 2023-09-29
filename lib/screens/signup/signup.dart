import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rola_app/constants/measures.dart';
import 'package:rola_app/widget/gradient_button.dart';
import 'package:rola_app/widget/input_field.dart';

import '../../styles/colors.dart';
import '../../styles/images.dart';
import '../../widget/rola_dropdown.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 8,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 32, bottom: 21),
                child: Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              const InputField(
                labelText: '* First Name',
              ),
              const InputField(labelText: '* Last Name'),
              const InputField(labelText: '* Email Address'),
              const Row(
                children: [
                  Expanded(
                    child: RolaDropdown(
                      items: ['1', '2', '3', '4'],
                      hint: '+1',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: InputField(labelText: '* Email Address'),
                  ),
                ],
              ),
              const RolaDropdown(
                items: ['1', '2', '3', '4'],
                hint: 'City',
              ),
              const RolaDropdown(
                items: ['1', '2', '3', '4'],
                hint: 'Gender',
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorSystem.black90,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    const Expanded(
                      child: InputField(
                        labelText: 'Birthday',
                      ),
                    ),
                    const Expanded(
                      child: RolaDropdown(
                        hint: 'MM',
                        items: ['1', '2', '3', '4'],
                      ),
                    ),
                    Expanded(
                      child: RolaDropdown(
                        hint: 'DD',
                        items:
                            List.generate(31, (index) => (index + 1).toString())
                                .toList(),
                      ),
                    ),
                    const Expanded(
                      child: RolaDropdown(
                        hint: 'YYYY',
                        items: ['1', '2', '3', '4'],
                      ),
                    ),
                  ],
                ),
              ),
              const InputField(
                labelText: 'Password',
                obscureText: true,
              ),
              const InputField(
                labelText: 'Confirm Password',
                obscureText: true,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 32),
                child: RolaGradientButton(label: 'Sign up'),
              ),
              Text(
                'Your phone number lets merchants and venues contact you about bookings and will not be shared',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
