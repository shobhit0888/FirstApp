import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/skim.dart';

class AddtoCart extends StatelessWidget {
  final Item skim;

  final _cart = CartModel();

  AddtoCart({super.key, required this.skim});

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(skim) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _skim = SkimModel();

          _cart.skim = _skim;
          _cart.add(skim);

          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add),
    );
  }
}
