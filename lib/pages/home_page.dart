import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalogue.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  final int days=30;
  final String name="Codepur";

  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(20, (index) => CatalogueModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
