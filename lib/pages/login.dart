import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/services/auth_service.dart';
import 'package:coffeebrew_flutter/pages/register.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  final Function toggleView;

  LoginPage ({required this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final AuthService _authServiceInstance = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Brew Login page"),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter an email'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 30),
              child: TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () async {
                print("Email: ${email}");
                print("Password: ${password}");
                await _authServiceInstance.signInAnon();
                //Navigator.pushNamed(context, '/loading');
              },
            ),
            Divider(height: 30.0,
            thickness: 2.0,
            ),
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){
                widget.toggleView();
              }, child: Text("Sign up"))
            ],))
          ]),
        ),
      ),
    );
  }
}
