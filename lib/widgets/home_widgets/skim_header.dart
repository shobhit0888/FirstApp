import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class SkimHeader extends StatelessWidget {
  const SkimHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Skiome".text.xl4.bold.color(context.theme.buttonColor).make(),
        "A way to Skill Development".text.xl2.make(),
      ],
    );
  }
}
