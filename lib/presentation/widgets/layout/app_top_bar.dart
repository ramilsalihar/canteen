import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/buttons/app_swipe_button.dart';
import 'package:canteen/presentation/widgets/layout/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.scaffoldKey,
    this.title,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isTitle = title != null;
    bool isAdmin = context.read<AuthBloc>().isAdmin;
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      title: isTitle
          ? Text(title!)
          : (isAdmin ? const AppSwipeButton() : const StatusBar()),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
