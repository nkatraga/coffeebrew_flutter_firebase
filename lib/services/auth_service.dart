import 'package:coffeebrew_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creating a custom brewcrew user object based on Firebaseuser
  CoffeebrewUser? _coffeebrewUserFromFirebaseuser(User? user){
    return user != null ? CoffeebrewUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<CoffeebrewUser?> get user {
    return _auth.authStateChanges()
        //.map((User? user) => _coffeebrewUserFromFirebaseuser(user)); - long form for the below line
        .map(_coffeebrewUserFromFirebaseuser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      User? firebaseuser = authResult.user;
      return _coffeebrewUserFromFirebaseuser(firebaseuser);
    } catch (e) {
      print("Anonymous signin failed with error ${e.toString()}");
      return null;
    }
  }
   //sign in with email and password

    //register with email and password

    //signout
    Future signOut() async {
      try{
        return await _auth.signOut();
      }catch (e){
        print("Signout failed with error ${e.toString()}");
        return null;
      }
    }

}





