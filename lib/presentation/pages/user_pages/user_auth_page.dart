import 'package:auto_route/auto_route.dart';
import 'package:canteen/core/widgets/buttons/app_button.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/user_widgets/login_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserAuthPage extends StatefulWidget {
  const UserAuthPage({super.key});

  @override
  State<UserAuthPage> createState() => _UserAuthPageState();
}

class _UserAuthPageState extends State<UserAuthPage> {
  final GlobalKey<FormState> loginKey = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: SafeArea(
          child: Form(
            key: loginKey,
            child: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoginField(
                      login: _loginController,
                      password: _passwordController,
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      title: 'Войти',
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                CreateUserWithEmailAndPassword(
                                  email: _loginController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
