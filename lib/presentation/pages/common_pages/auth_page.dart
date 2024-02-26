import 'package:auto_route/auto_route.dart';
import 'package:canteen/core/routes/app_router.gr.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/common_widgets/login_fields.dart';
import 'package:canteen/presentation/widgets/common_widgets/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthUserSuccessState ||
                  state is AuthAdminSuccessState) {
                context.router.replace(const HomeRoute());
              }
            },
            builder: (context, state) {
              bool isLogin = state is LoginState;
              String title = isLogin ? 'Вход' : 'Регистрация';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Flexible(
                    child: isLogin ? const SignupFields() : const LoginField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                state is LoginState
                                    ? ShowSignupPage()
                                    : ShowLoginPage(),
                              );
                        },
                        child: Text(title),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
