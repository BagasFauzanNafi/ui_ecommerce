import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _saveText = '';


  bool get isLoggedIn => _isLoggedIn;
  String get savedText => _saveText;

  AuthProvider() {
    loadAuth();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    _saveText = prefs.getString("saveText") ?? '';
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }

  void saveText(String text) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _saveText = text;
    await prefs.setString('saveText', text);
    notifyListeners();
  }

  // void logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = false;
  //   await prefs.setBool("isLoggedIn", false);
  //   notifyListeners();
  // }
}
