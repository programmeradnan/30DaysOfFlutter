import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item Catalogue;
  AddToCart({
    Key? key, required this.Catalogue,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(Catalogue)??false;
    return ElevatedButton(onPressed: () {
      if(!isInCart) {
        isInCart = isInCart.toggle();
        final _Catalogue = CatalogueModel();

        _cart.catalogue = _Catalogue;
        _cart.add(Catalogue);
        // setState(() {});
      }
    },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(StadiumBorder(),)
      ),
      child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus);
  }
}