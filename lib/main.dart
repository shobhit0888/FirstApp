import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home_page.dart';

void main() {
  runApp(Skim());
}

class Skim extends StatelessWidget {
  const Skim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage()
    );
  }
}
