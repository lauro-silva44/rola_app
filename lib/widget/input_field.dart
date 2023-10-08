import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rola_app/styles/colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.labelText,
      this.obscureText,
      this.changeContrast = false,
      this.inputFormatters,
      this.keyboardType,
      this.controller});
  final String labelText;
  final bool? obscureText;
  final bool changeContrast;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: changeContrast
              ? ColorSystem.black.withOpacity(.8)
              : Theme.of(context).colorScheme.onBackground),
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
        fillColor: changeContrast
            ? Theme.of(context).colorScheme.onBackground
            : ColorSystem.black90,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: changeContrast
                  ? ColorSystem.black.withOpacity(.8)
                  : Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
