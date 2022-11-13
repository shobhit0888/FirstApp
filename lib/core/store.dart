// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/skim.dart';

class MyStore extends VxStore {
  late SkimModel skim;
  late CartModel cart;
  MyStore()
   {
    skim = SkimModel();
    cart = CartModel();
    cart.skim = skim;
  }
}
