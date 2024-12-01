import 'package:canteen/core/di.dart';
import 'package:canteen/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();
    return MaterialApp.router(
      title: 'Canteen',
      routerConfig: router.config(),
    );
  }
}

