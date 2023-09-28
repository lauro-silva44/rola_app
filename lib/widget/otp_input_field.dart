import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../styles/colors.dart';

class OptInputField extends StatelessWidget {
  const OptInputField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 39,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onBackground),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counter: const Offstage(),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.black.withOpacity(.5))),
          hintText: '-',
          focusedBorder: const GradientOutlineInputBorder(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(123, 97, 255, 0.8),
                Color.fromRGBO(0, 136, 239, 0.8),
                Color.fromRGBO(0, 227, 239, 0.3),
              ],
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
