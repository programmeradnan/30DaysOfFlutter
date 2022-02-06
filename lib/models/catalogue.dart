class CatalogueModel{
  static final itmes=[
    Item(id: 1,
    name: "Iphone 12 Pro",
    desc: "Apple iphone 12th generation",
    price: 999,
    color: "#33505a",
    image: "",
    )
  ];
}


class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final products=[

];