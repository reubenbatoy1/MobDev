class Product {
  final int id;
  final String name;
  final double price;
  int quantity;

  Product(this.id, this.name, this.price, this.quantity);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: \$$price, quantity: $quantity)';
  }
}
