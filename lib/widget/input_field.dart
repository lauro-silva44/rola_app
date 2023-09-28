import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.labelText, this.obscureText});
  final String labelText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: const Color(0xFF2E3B49),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
