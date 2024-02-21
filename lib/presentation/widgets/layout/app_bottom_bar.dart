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
    final theme = Theme.of(context);
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
          customNavBarItem(
            icon: Icons.people,
            index: 0,
            activeColor: theme.primaryColor,
          ),
          customNavBarItem(
            icon: Icons.home_rounded,
            index: 1,
            activeColor: theme.primaryColor,
          ),
          customNavBarItem(
            icon: Icons.qr_code_scanner_outlined,
            index: 2,
            activeColor: theme.primaryColor,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem customNavBarItem({
    required IconData icon,
    required int index,
    required Color activeColor,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == index ? activeColor : Colors.transparent,
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
