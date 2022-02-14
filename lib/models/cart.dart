import 'package:flutter_catalogue/core/store.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  // static final cartModel = CartModel.internal();
  // CartModel.internal();
  // factory CartModel() => cartModel;

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
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

  //remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }

}


class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}