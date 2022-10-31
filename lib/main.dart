import 'package:flutter/material.dart';

void main() {
  runApp(Skim());
}

class Skim extends StatelessWidget {
  const Skim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Material(
      child:Center(
      child: Container(
        child: Text("Welcome to Skiome"),
      ),
    )
      )
    );
  }
}
