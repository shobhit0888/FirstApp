import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

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
