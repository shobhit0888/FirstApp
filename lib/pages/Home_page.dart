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
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class SkimHeader extends StatelessWidget {
  const SkimHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Skiome".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        "A way to Skill Development".text.xl2.make(),
      ],
    );
  }
}

class SkimList extends StatelessWidget {
  const SkimList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: SkimModel.items.length,
        itemBuilder: ((context, index) {
          final skim = SkimModel.items[index];
          return SkimItem(skim: skim);
        }));
  }
}

class SkimItem extends StatelessWidget {
  const SkimItem({
    Key? key,
    required this.skim,
  })  : assert(skim != null),
        super(key: key);
  final Item skim;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        SkimImage(image: skim.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            skim.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
            skim.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "Rs.${skim.price}".text.bold.xl2.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child: "Buy".text.make()),
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class SkimImage extends StatelessWidget {
  final String image;

  const SkimImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
