import 'package:flutter/material.dart';

enum Status { open, closed }

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isOpen = Status.open == Status.open;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      height: 40,
      width: 100,
      child: Center(child: const Text('Open')),
    );
  }
}
