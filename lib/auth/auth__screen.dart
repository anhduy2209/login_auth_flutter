import 'package:flutter/material.dart';
import 'package:login_test/pages/login__screen.dart';

import '../pages/register__screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLoginScreen = true;

  void toggleScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(showRegisterScreen: toggleScreen);
    } else {
      return RegisterScreen(showLoginScreen: toggleScreen);
    }
  }
}
