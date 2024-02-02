import 'package:canteen/core/routes/app_router.dart';
import 'package:canteen/core/theme/app_theme.dart';
import 'package:canteen/data/datasources/firebase_auth_data_source.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanteenApp extends StatelessWidget {
  const CanteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            authService: FirebaseAuthDataSourceImpl(
              authService: FirebaseAuth.instance,
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Canteen App',
        routerConfig: appRouter.config(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
