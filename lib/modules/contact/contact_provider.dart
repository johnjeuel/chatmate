
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String uid = '';

  ContactProvider() {
   Stream<SharedPreferences> prefs = _prefs.asStream();
   prefs.listen((event) {
     uid = event.getString('uid')!;
     notifyListeners();
   });
  }

  Future getUid() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('uid');
  }
}