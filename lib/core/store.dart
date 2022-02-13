import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  CatalogueModel catalogue;
  CartModel cart;

  MyStore(){
    catalogue=CatalogueModel();
    cart=CartModel();
    cart.catalogue=catalogue;
  }


}