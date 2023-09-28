import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:rola_app/styles/colors.dart';

class RolaGradientButton extends StatelessWidget {
  const RolaGradientButton(
      {super.key,
      this.icon,
      required this.label,
      this.isOutlined = false,
      this.changeToWhite = false,
      this.suffixIcon});
  final Widget? icon;
  final Widget? suffixIcon;
  final String label;
  final bool isOutlined;
  final bool changeToWhite;

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          const SizedBox(
            width: 10,
          ),
        ],
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
              color: changeToWhite
                  ? ColorSystem.black.withOpacity(.8)
                  : Theme.of(context).colorScheme.onBackground),
        ),
        if (suffixIcon != null) ...[
          const SizedBox(
            width: 10,
          ),
          suffixIcon!,
        ],
      ],
    );
    if (isOutlined) {
      return OutlineGradientButton(
          inkWell: true,
          padding: EdgeInsets.zero,
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(0, 136, 239, 1),
              Color.fromRGBO(123, 97, 255, 0.6),
            ],
          ),
          strokeWidth: 2,
          radius: const Radius.circular(76),
          child: SizedBox(height: 48, child: content));
    }
    return ElevatedButton(
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: changeToWhite
                  ? const [
                      Colors.white,
                      Colors.white,
                    ]
                  : const [
                      Color.fromRGBO(123, 97, 255, 0.6),
                      Color.fromRGBO(0, 136, 239, 1),
                    ],
              stops: const [0.05, 0.8],
            ),
          ),
          height: 48,
          child: content),
    );
  }
}
