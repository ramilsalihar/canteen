import 'package:auto_route/auto_route.dart';
import 'package:canteen/presentation/widgets/layout/app_bottom_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the user home page'),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomBar(
        selectedIndex: 0,
        onItemTapped: (_) {},
      ),
    );
  }
}
