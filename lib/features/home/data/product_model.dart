//call api to get product list
//response will be a list of map<string,dynamic>

class ProductModel {
  final int id;
  final String name;
  final String price;
  final String weight;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.image,
  });

  String get description =>
      "$name is nutritious. $name may be good for weight loss. $name may be good for your heart. As part of a healthy and varied diet.";
}

List<ProductModel> offers = [
  ProductModel(
    id: 1,
    name: "Banana",
    price: "\$50",
    weight: "1kg",
    image: "assets/images/banana.png",
  ),
  ProductModel(
    id: 2,
    name: "Apple",
    price: "60",
    weight: "1kg",
    image: "assets/images/apple.png",
  ),
  ProductModel(
    id: 3,
    name: "Mango",
    price: "70",
    weight: "1kg",
    image: "assets/images/mango.jpg",
  ),
  ProductModel(
    id: 4,
    name: "Orange",
    price: "80",
    weight: "1kg",
    image: "assets/images/orange.png",
  ),
  ProductModel(
    id: 5,
    name: "strawberry",
    price: "90",
    weight: "1kg",
    image: "assets/images/strawberry.jpg",
  ),
];
List<ProductModel> bestSelling = [
  ProductModel(
    id: 1,
    name: "Carrot",
    price: "50",
    weight: "1kg",
    image: "assets/images/carrott.jpg",
  ),
  ProductModel(
    id: 2,
    name: "Cucumber",
    price: "60",
    weight: "1kg",
    image: "assets/images/cucumbers.jpg",
  ),
  ProductModel(
    id: 3,
    name: "Onion",
    price: "70",
    weight: "1kg",
    image: "assets/images/onion.jpg",
  ),
  ProductModel(
    id: 4,
    name: "potato",
    price: "80",
    weight: "1kg",
    image: "assets/images/potato.jpg",
  ),
  ProductModel(
    id: 5,
    name: "garlic",
    price: "90",
    weight: "1kg",
    image: "assets/images/garlic.jpg",
  ),
];
List<ProductModel> allproduct = [
  ProductModel(
    id: 1,
    name: "Carrot",
    price: "50",
    weight: "1kg",
    image: "assets/images/carrott.jpg",
  ),
  ProductModel(
    id: 2,
    name: "Cucumber",
    price: "60",
    weight: "1kg",
    image: "assets/images/cucumbers.jpg",
  ),
  ProductModel(
    id: 3,
    name: "Onion",
    price: "70",
    weight: "1kg",
    image: "assets/images/onion.jpg",
  ),
  ProductModel(
    id: 4,
    name: "potato",
    price: "80",
    weight: "1kg",
    image: "assets/images/potato.jpg",
  ),
  ProductModel(
    id: 5,
    name: "garlic",
    price: "90",
    weight: "1kg",
    image: "assets/images/garlic.jpg",
  ),
  ProductModel(
    id: 6,
    name: "Banana",
    price: "50",
    weight: "1kg",
    image: "assets/images/banana.png",
  ),
  ProductModel(
    id: 7,
    name: "Apple",
    price: "60",
    weight: "1kg",
    image: "assets/images/apple.png",
  ),
  ProductModel(
    id: 8,
    name: "Mango",
    price: "70",
    weight: "1kg",
    image: "assets/images/mango.jpg",
  ),
  ProductModel(
    id: 9,
    name: "Orange",
    price: "80",
    weight: "1kg",
    image: "assets/images/orange.png",
  ),
  ProductModel(
    id: 10,
    name: "strawberry",
    price: "90",
    weight: "1kg",
    image: "assets/images/strawberry.jpg",
  ),
];
