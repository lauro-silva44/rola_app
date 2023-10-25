import 'package:flutter/material.dart';
import 'package:rola_app/styles/colors.dart';

import '../styles/images.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade400,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.asset(
                  PngAssets.snowboarding,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Roger Sanchez',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorSystem.black90,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'R.Sanchez@email.com',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorSystem.purple,
                          fontSize: 12,
                        ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '931',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorSystem.purple, fontSize: 36, height: 1),
                  ),
                  Text(
                    'Points',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorSystem.black90,
                          fontSize: 10,
                        ),
                  ),
                ],
              ),
              FilledButton.icon(
                onPressed: () {},
                style:
                    TextButton.styleFrom(backgroundColor: ColorSystem.purple),
                icon: const Icon(Icons.military_tech_outlined,
                    color: Colors.white),
                label: const Text(
                  'Redeem',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
