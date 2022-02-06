import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  final int days=30;
  final String name="Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: ListView.builder(
        itemCount: CatalogueModel.itmes.length,
        itemBuilder: (context,index){
          return ItemWidget();
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
