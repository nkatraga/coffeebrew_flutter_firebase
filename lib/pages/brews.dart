import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/pages/brewSpec.dart';
import 'package:coffeebrew_flutter/pages/brewCard.dart';

class Brews extends StatefulWidget {
  const Brews({Key? key}) : super(key: key);

  @override
  _BrewsState createState() => _BrewsState();
}

class _BrewsState extends State<Brews> {

  List<BrewSpec> brews = [
    BrewSpec(person: "yoshi", strength: 1, sugar: 2),
    BrewSpec(person: "toad", strength: 2, sugar: 3),
    BrewSpec(person: "luigi", strength: 1, sugar: 3),
    BrewSpec(person: "mario", strength: 3, sugar: 2),
    BrewSpec(person: "bowser", strength: 4, sugar: 4)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brew Crew"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: brews.length,
            itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                //Navigator.pushReplacementNamed(context, '/login');
                //cupertinoAlert;
                showAlertDialog(context);

              },
              child: BrewCard(
              brewSpec: brews[index],
              ),
            );

        },),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () { },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}