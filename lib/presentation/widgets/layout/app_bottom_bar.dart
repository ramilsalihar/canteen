import 'package:canteen/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(
          context.dimens.borderRadius,
        ),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          customNavBarItem(Icons.people, 0),
          customNavBarItem(Icons.home_rounded, 1),
          customNavBarItem(Icons.qr_code_scanner_outlined, 2),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem customNavBarItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == index ? Colors.blue : Colors.transparent,
        ),
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          icon,
        ),
      ),
      label: '',
    );
  }
}
