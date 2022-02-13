import 'dart:convert';

class CatalogueModel{
  static List<Item>? items;

  //get item by id
  static Item? getByID(int id) => items?.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  static Item getByPos(int pos) => items![pos];
  // =[
  //   Item(id: 1,
  //   name: "Iphone 12 Pro",
  //   desc: "Apple iphone 12th generation",
  //   price: 999,
  //   color: "#33505a",
  //   image: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-pro-r1.jpg",
  //   )
  // ];
}


class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

    factory Item.fromMap(Map<String,dynamic> map){
      return Item(
          id: map["id"],
          name: map ["name"],
          desc: map ["desc"],
          price: map ["price"],
          color: map ["color"],
          image: map ["image"]
      );
    }

    toMap()=>{
      "id":id,
      "name":name,
      "desc":desc,
      "price":price,
      "color":color,
      "image":image,
    };
}

final products=[

];