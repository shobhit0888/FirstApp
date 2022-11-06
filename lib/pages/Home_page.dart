import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Skiome"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Skiome"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
