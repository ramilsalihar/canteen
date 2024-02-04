import 'package:canteen/core/validation/form_validation.dart';
import 'package:canteen/core/widgets/forms/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class InputFields {
  static Widget email({
    required TextEditingController controller,
  }) {
    return CustomTextFormField(
      hintText: 'ramil.salihar_2025@ucentralasia.org',
      icon: const Icon(Icons.email),
      controller: controller,
      validator: (_) => FormValidation.validateEmail(controller.text),
    );
  }

  static Widget password({
    required TextEditingController controller,
    final String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      hintText: 'Введите ваш пароль',
      icon: const Icon(Icons.lock),
      controller: controller,
      validator: validator ??
          (_) => FormValidation.validatePassword(
                controller.text,
              ),
      obscureText: true,
    );
  }

  static Widget phoneNumber({
    required TextEditingController controller,
  }) {
    return CustomTextFormField(
      hintText: 'Введите ваш номер телефона',
      icon: const Icon(Icons.phone),
      controller: controller,
      validator: (_) => FormValidation.validatePhoneNumber(
        controller.text,
      ),
    );
  }
}
