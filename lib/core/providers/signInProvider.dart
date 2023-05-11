import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isCheck = false;
  String _emailError = "";
  String _passwordError = "";
  String _confirmPasswordError = "";
  String _nameError = "";

  bool get isCheck => _isCheck;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get nameError => _nameError;
  String get confirmPasswordError => _confirmPasswordError;

  void checkValue(bool value) {
    _isCheck = value;
    notifyListeners();
  }

  void setEmailError(String value) {
    _emailError = value;
    notifyListeners();
  }

  void setPasswordError(String value) {
    _passwordError = value;
    notifyListeners();
  }

  void setNameError(String value) {
    _nameError = value;
    notifyListeners();
  }

  void setConfirmPasswordError(String value) {
    _confirmPasswordError = value;
    notifyListeners();
  }
}
