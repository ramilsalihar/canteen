import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class AppSwipeButton extends StatelessWidget {
  const AppSwipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LiteRollingSwitch(
      value: true,
      textOn: 'Open',
      textOff: 'Closed',
      iconOn: Icons.done,
      iconOff: Icons.remove_circle_outline,
      textSize: 16.0,
      onChanged: (bool state) {
        print('Current State of SWITCH IS: $state');
      },
      onTap: () {},
      onDoubleTap: () {},
      onSwipe: () {},
    );
  }
}
