// ignore_for_file: non_constant_identifier_names

class Item {
  String imgPath;
  double price;
  String location;
  String Name;

  Item({required this.imgPath,required this.Name, required this.price, this.location = "Main branch"});
}

final List<Item> items = [
  Item(Name : "Product1" ,price: 12.99, imgPath: "assets/img/1.webp", location: "Ali shop"),
  Item(Name : "Product2" ,price: 17.99, imgPath: "assets/img/2.webp"),
  Item(Name : "Product3" ,price: 19.99, imgPath: "assets/img/3.webp"),
  Item(Name : "Product4" ,price: 1.99,  imgPath: "assets/img/4.webp"),
  Item(Name : "Product5" ,price: 10.99, imgPath: "assets/img/5.webp"),
  Item(Name : "Product6" ,price: 21.99, imgPath: "assets/img/6.webp"),
  Item(Name : "Product7" ,price: 28.99, imgPath: "assets/img/7.webp"),
  Item(Name : "Product8" ,price: 45.99, imgPath: "assets/img/0.webp"),
];