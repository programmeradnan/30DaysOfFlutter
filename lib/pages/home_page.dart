import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Catalogue App",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items != null &&  CatalogueModel.items.isNotEmpty)?
        ListView.builder(
          itemCount: CatalogueModel.items.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: CatalogueModel.items[index],
            );
          },
        )
            :Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
