
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chatmate/widgets/app_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _email = '';
  String _password = '';

  get email => _email;
  get password => _password;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String pw) {
    _password = pw;
    notifyListeners();
  }

  RegExp emailValid = new RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: 'Logging In');
    if(_email.isEmpty){
      EasyLoading.showError( 'Email is required');
      return;
    }else if(_password.isEmpty){
      EasyLoading.showError( 'Password is required');
      return;
    }else if(!emailValid.hasMatch(_email)){
      EasyLoading.showError( 'Invalid Email Format!');
      return;
    }
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: _email,
          password: _password
      );
      print('user ${userCredential.user!.uid}');
      _firestore.collection('users').doc(userCredential.user!.uid).update({
        'isActive': true
      });
      prefs.setString('uid', userCredential.user!.uid);
      Get.offAllNamed('/dashboard');

      EasyLoading.showSuccess( 'Welcome ${userCredential.user?.displayName}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError( 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Wrong password provided for that user.');
      }
    }catch(e){
      print('ee $e');
    }
  }
}