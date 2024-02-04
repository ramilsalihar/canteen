class FormValidation {
  FormValidation();

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Почта не должна быть пустой';
    } else if (!value.contains('@')) {
      return 'Почта не верна';
    } else if (!value.contains('_20')) {
      return 'Почта не верна';
    } else if (!value.contains('ucentralasia.org')) {
      return 'Используйте почту ucentralasia.org';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Пароль не должен быть пустым';
    } else if (value.length < 6) {
      return 'Пароль должен состоять из более чем 6 символов';
    }
    return null;
  }

  static String? validatePasswordMatch(String value, String password) {
    if (value.isEmpty) {
      return 'Пароль не должен быть пустым';
    } else if (value != password) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Номер не должен быть пустым';
    } else if (value.length < 10) {
      return 'Номер телефона должен состоять из более 9 символов';
    }
    return null;
  }
}
