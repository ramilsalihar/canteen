import 'package:auto_route/auto_route.dart';
import 'package:canteen/core/routes/app_router.gr.dart';
import 'package:canteen/core/widgets/buttons/app_button.dart';
import 'package:canteen/core/widgets/forms/input_field.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginField extends StatefulWidget {
  const LoginField({
    super.key,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final GlobalKey<FormState> loginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Вход',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 30),
          InputFields.email(controller: _emailController),
          const SizedBox(height: 20),
          InputFields.password(controller: _passwordController),
          const SizedBox(height: 10),
          AppButton(
            title: 'Войти',
            onPressed: () {
              if (loginKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      CreateUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                context.router.replace(const UserHomeRoute());
              }
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text('Забыли пароль?'),
          ),
        ],
      ),
    );
  }
}
