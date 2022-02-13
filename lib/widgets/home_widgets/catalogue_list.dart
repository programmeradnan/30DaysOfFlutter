import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/pages/home_detail_page.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogueModel.items?.length,
        itemBuilder: (context,index){
          final Catalogue=CatalogueModel.items![index];
          return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeDetailPage(Catalogue: Catalogue,),
              ),
              ),
              child: CatalogueItem(Catalogue: Catalogue));
        }
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item Catalogue;

  const CatalogueItem({Key? key, required this.Catalogue})
      : assert(Catalogue != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(Catalogue.id.toString()),
            child: CatalogueImage(
              image: Catalogue.image,
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Catalogue.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              Catalogue.desc.text.textStyle(context.captionStyle!).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${Catalogue.price}".text.bold.xl.make(),
                  _AddToCart( Catalogue: Catalogue,)
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item Catalogue;
  const _AddToCart({
    Key? key, required this.Catalogue,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded=false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      isAdded = isAdded.toggle();
      final _Catalogue = CatalogueModel();
      final _cart = CartModel();
      _cart.catalogue=_Catalogue;
      _cart.add(widget.Catalogue);
      setState(() {

      });
    },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(StadiumBorder(),)
      ),
      child: isAdded? Icon(Icons.done) : "Add to cart".text.make(),);
  }
}
