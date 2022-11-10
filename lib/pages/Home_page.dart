// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/skim.dart';

import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final skimJson = await rootBundle.loadString("assets/files/Skim.json");
    final decodeData = jsonDecode(skimJson);
    var productsData = decodeData["products"];
    SkimModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(10, (index) => SkimModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Skiome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (SkimModel.items != null && SkimModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = SkimModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                        ),
                      ),
                      child: Image.asset(item.image),
                      footer: Text(item.price.toString()),
                    ),
                  );
                },
                itemCount: SkimModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
