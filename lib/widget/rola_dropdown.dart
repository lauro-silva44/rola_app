import 'package:flutter/material.dart';

import '../styles/colors.dart';

class RolaDropdown extends StatelessWidget {
  const RolaDropdown(
      {super.key,
      required this.items,
      required this.hint,
      this.addBorder = false,
      this.onChanged});
  final List<String> items;
  final String hint;
  final bool addBorder;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(Icons.keyboard_arrow_down),
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: addBorder
              ? BorderSide(color: ColorSystem.black40)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: addBorder
              ? BorderSide(color: ColorSystem.black40)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: ColorSystem.black90,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
      ),
      onChanged: onChanged,
      items: items
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
    );
  }
}
