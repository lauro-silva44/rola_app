import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ProfileInformationField extends StatelessWidget {
  const ProfileInformationField(
      {super.key,
      required this.fieldName,
      required this.description,
      this.onPressed});
  final String fieldName;
  final String description;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fieldName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorSystem.black40,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade700,
              ),
              onPressed: onPressed ?? () {},
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
