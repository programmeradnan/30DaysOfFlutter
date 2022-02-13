import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(MyTheme.darkBluishColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p16().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text.xl5.color(MyTheme.darkBluishColor).make(),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Buying not supported yet".text.make(),)
                );
              },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(StadiumBorder(),)
            ),
              child: "Buy".text.xl.white.make(),
          ).h(48).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.xl3.makeCentered() :
    ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
          _cart.remove(_cart.items[index]);
          // setState(() {});
          },
        ),
        title: _cart.items[index]!.name.text.make(),
      ),
    );
  }
}
