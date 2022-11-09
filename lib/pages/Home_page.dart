import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/skim.dart';

import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  final dummylist = List.generate(50, (index) => SkimModel.items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skiome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
