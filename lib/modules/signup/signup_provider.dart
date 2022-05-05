
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';

  get email => _email;
  get password => _password;
  get firstName => _firstName;
  get lastName => _lastName;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String pw) {
    _password = pw;
    notifyListeners();
  }

  void setFirstName(String fn) {
    _firstName = fn;
    notifyListeners();
  }

  void setLastName(String ln) {
    _lastName = ln;
    notifyListeners();
  }

  /// TODO: implement sign up functionality
  void signup () {

  }
}