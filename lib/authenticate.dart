import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/pages/login.dart';
import 'package:coffeebrew_flutter/pages/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;
  void toggleView () {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin){
      print("showLogin property: ${showLogin.toString()}");
      return LoginPage(toggleView: toggleView);
    }else {
      print("showLogin property: ${showLogin.toString()}");
      return RegisterPage(toggleView: toggleView);
    }
  }
}
