import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/pages/brewEdit.dart';
import 'package:coffeebrew_flutter/pages/brews.dart';
import 'package:coffeebrew_flutter/pages/loading.dart';
import 'package:coffeebrew_flutter/pages/login.dart';
import 'package:coffeebrew_flutter/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:coffeebrew_flutter/services/auth_service.dart';
import 'package:coffeebrew_flutter/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CoffeebrewUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/wrapper",
        routes: {
          "/brewEdit": (context) => BrewEdit(),
          "/brews": (context) => Brews(),
          "/loading": (context) => LoadingPage(),
          //"/login": (context) => LoginPage(),
          "/wrapper": (context) => Wrapper(),
        },
        home: const Text('Flutter Demo Home Page'),
      ),
    );
  }
}

