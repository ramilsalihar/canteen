import 'package:canteen/core/validation/form_validation.dart';
import 'package:canteen/core/widgets/buttons/app_button.dart';
import 'package:canteen/core/widgets/forms/input_field.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPassword = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Form(
      key: loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Регистрация',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 30),
          InputFields.email(controller: emailController),
          const SizedBox(height: 10),
          InputFields.phoneNumber(controller: phoneController),
          const SizedBox(height: 20),
          InputFields.password(controller: passwordController),
          const SizedBox(height: 20),
          InputFields.password(
            controller: repeatPassword,
            validator: (_) => FormValidation.validatePasswordMatch(
              repeatPassword.text,
              passwordController.text,
            ),
          ),
          const SizedBox(height: 20),
          AppButton(
              title: 'Зарегистрироваться',
              onPressed: () {
                if (loginKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        CreateUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                }
              })
        ],
      ),
    );
  }
}
