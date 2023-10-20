import 'package:flutter/material.dart';

import '../styles/colors.dart';

class RolaFilledListButton extends StatelessWidget {
  const RolaFilledListButton({super.key, required this.list});
  final List<List<Object>> list;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        e[1] as bool ? Colors.white : ColorSystem.black90,
                  ),
                  child: Text(
                    e[0] as String,
                    style: TextStyle(
                        color: e[1] as bool ? ColorSystem.black : Colors.white,
                        fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    e[1] = !(e[1] as bool);
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
