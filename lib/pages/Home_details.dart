import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/skim.dart';

class HomeDetailPage extends StatelessWidget {
  final Item skim;
  const HomeDetailPage({super.key, required this.skim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "Rs.${skim.price}".text.bold.xl4.purple500.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child: "Buy".text.xl.make())
                .wh(100, 50),
          ],
        ).px20().py8(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(skim.id.toString()), child: Image.asset(skim.image))
                .centered()
                .h20(context)
                .p16(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      skim.name.text.bold.xl4
                          .color(context.theme.buttonColor)
                          .make(),
                      skim.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .center
                          .make(),
                      "Ipsum sadipscing ea lorem consetetur amet stet amet sit. Sit sea accusam duo no aliquyam gubergren et, elitr sed kasd erat dolor nonumy, et kasd erat sed voluptua ipsum et sea et sit, elitr invidunt no et consetetur consetetur dolor diam ea, consetetur dolor at et ipsum. Sanctus ipsum clita."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .px24()
                          .py12(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
