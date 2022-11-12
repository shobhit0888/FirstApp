// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/skim.dart';
import 'package:flutter_application_1/widgets/themes.dart';

import '../widgets/drawer.dart';
import '../widgets/items_widget.dart';
import '../widgets/home_widgets/skim_header.dart';
import '../widgets/home_widgets/skim_list.dart';

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
        backgroundColor: Color.fromARGB(255, 134, 248, 248),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkimHeader(),
                if (SkimModel.items != null && SkimModel.items.isNotEmpty)
                  SkimList().expand()
                else
                  Center(
                    child: CircularProgressIndicator().centered().expand(),
                  )
              ],
            ),
          ),
        ));
  }
}
