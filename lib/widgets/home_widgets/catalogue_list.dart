import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/pages/home_detail_page.dart';
import 'package:flutter_catalogue/widgets/home_widgets/add_to_cart.dart';
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
                  AddToCart( Catalogue: Catalogue,)
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}

