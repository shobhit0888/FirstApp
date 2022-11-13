import 'package:flutter_application_1/models/skim.dart';

class CartModel {
  
  late SkimModel _skim;
  final List<int> _itemIds = [];
  SkimModel get skim => _skim;
  set skim(SkimModel newSkim) {
    assert(newSkim != null);
    _skim = newSkim;
  }

  List<Item> get items => _itemIds.map((id) => _skim.getById(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
