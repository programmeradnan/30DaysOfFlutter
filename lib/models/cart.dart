import 'package:flutter_catalogue/models/catalogue.dart';

class CartModel {
  //catalogue field
  late CatalogueModel _Catalogue;

  //collection of Ids - store ids of each item
  final List<int> _itemIds = [];

  //get catalogue
  CatalogueModel get catalogue => _Catalogue;

  set catalogue(CatalogueModel newCatalogue){
    assert(newCatalogue!=null);
    _Catalogue = newCatalogue;
  }

  //get items in the cart
  List<Item?> get items => _itemIds.map((id) => _Catalogue.getByID(id)).toList();

  //get total price
  num get totalPrice => items.fold(0, (total, current) => total + current!.price);

  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }

}