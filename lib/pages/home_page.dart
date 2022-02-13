import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/home_widgets/catalogue_header.dart';
import 'package:flutter_catalogue/widgets/home_widgets/catalogue_list.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'home_widgets/catalogue_header.dart';
// import 'home_widgets/catalogue_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days=30;

  final String name="Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogueJson = await rootBundle.loadString("assets/files/catalogue.json");
    final decodeData = jsonDecode(catalogueJson);
    var productsData = decodeData["products"];
    CatalogueModel.items = List.from(productsData).
    map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.cardColor,
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, MyRoute.CartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if(CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                CatalogueList().py16().expand()
              else
                Center(child: CircularProgressIndicator().expand(),
                )
            ],
          ),
        ),
      ),
    );
  }
}


