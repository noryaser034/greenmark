class CartItem {
  final String name;
  final String image;
  final String weight;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
    this.quantity = 1,
  });
}
