import 'package:flutter/material.dart';
import 'package:rola_app/styles/colors.dart';
import 'package:rola_app/widget/bottom_navigation_bar.dart';

import '../../widget/profile_card.dart';
import '../../widget/profile_information_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const ProfileCard(),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Account',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorSystem.black40,
                      fontSize: 24,
                    ),
              ),
              const ProfileInformationField(
                fieldName: 'Account Information',
                description: 'Change your account information',
              ),
              const ProfileInformationField(
                fieldName: 'Wallet',
                description: 'Manage payment methods',
              ),
              const ProfileInformationField(
                fieldName: 'Favorites',
                description: 'Manage favorites',
              ),
              const ProfileInformationField(
                fieldName: 'Friends',
                description: 'Manage friends',
              ),
              const ProfileInformationField(
                fieldName: 'Settings',
                description:
                    'Change application, language & notification options',
              ),
              const ProfileInformationField(
                fieldName: 'Deactivate Account',
                description: 'Manage closure of your ROLA account',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: ColorSystem.black90,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 48)),
                  onPressed: () {},
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RolaBottomNavigationBar(),
    );
  }
}
