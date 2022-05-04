import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  //* Variable to check visibility of password
  bool _isObscuredPass = true;

  get isObscurePass => _isObscuredPass;

  set isObscurePass(value) {
    _isObscuredPass = value;
    notifyListeners();
  }

  //* Check valid email format
  String? emailValidator(String email) {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email) ||
        email == "") {
      return 'Email không hợp lệ';
    } else {
      return null;
    }
  }

  //* Check valid password
  String? passwordValidator(String password) {
    if (password.isEmpty || password.length < 6) {
      return 'Mật khẩu quá yêu';
    } else {
      return null;
    }
  }
}