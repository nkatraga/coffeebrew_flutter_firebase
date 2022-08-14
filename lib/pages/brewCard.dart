import 'package:flutter/material.dart';
import 'package:coffeebrew_flutter/pages/brewSpec.dart';

class BrewCard extends StatelessWidget {
  final BrewSpec brewSpec;
  final Map brewColors = {
    1:Colors.brown[300],
    2:Colors.brown[500],
    3:Colors.brown[700],
    4:Colors.brown[900],
  };

  BrewCard({required this.brewSpec});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: brewColors[brewSpec.strength],
        ),
        title: Text(brewSpec.person),
        subtitle: Text("Takes ${brewSpec.sugar} sugar(s)"),
      ),
    );
  }
}
