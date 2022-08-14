import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/home.dart';
import 'package:coffeebrew_flutter/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:coffeebrew_flutter/models/user.dart';
import 'package:coffeebrew_flutter/pages/login.dart';
import 'package:coffeebrew_flutter/pages/register.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loggedInUser = Provider.of<CoffeebrewUser?>(context);
    print(loggedInUser?.uid);

    //Return home or authenticate
    //return Home();
    if (loggedInUser != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
