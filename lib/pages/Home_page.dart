import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      
       title: const Text("Skiome"),
       ),
            body: Center(
              child: Container(
                 child: Text("Welcome to Skiome"),
      ),
    ),
    drawer: Drawer(),
    );
  }
}