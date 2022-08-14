import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/services/auth_service.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  final AuthService _authServiceInstance = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: Text("Signin to Brewcrew"),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _authServiceInstance.signOut();
              }
              )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ElevatedButton(
            child: Text("Signin"),
            onPressed: () async {
              dynamic authResult = await _authServiceInstance.signInAnon();
              //String authResult = 'something';
              if (authResult == null) {
                print("Authentication failed");
              } else {
                print("signed in");
                print(authResult.uid);
              }
            },
          ),
        ),
      ),
    );
  }
}
