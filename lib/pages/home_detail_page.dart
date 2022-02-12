import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item Catalogue;
  const HomeDetailPage({Key? key, required this.Catalogue})
      : assert(Catalogue!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${Catalogue.price}".text.bold.xl4.red800.make(),
          ElevatedButton(onPressed: (){},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder(),)
            ),
            child: "Add to cart".text.xl.make(),
          ).wh(120, 48),
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(Catalogue.id.toString()),
              child: Image.network(Catalogue.image),
            ).h32(context),
            Expanded(
                child:
                VxArc(
              height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        Catalogue.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                        Catalogue.desc.text.textStyle(context.captionStyle!).xl.make(),
                        10.heightBox,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas iaculis congue tellus. Praesent dictum fringilla felis non congue. Nunc non eros lorem. Vestibulum sagittis lacus sed enim rutrum, id sagittis neque mattis. Mauris eget ornare quam. Etiam tincidunt faucibus ante at dapibus. Donec efficitur non justo eget semper. Maecenas elementum aliquet libero eu consectetur."
                            .text.textStyle(context.captionStyle!).make().p16(),
                      ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
