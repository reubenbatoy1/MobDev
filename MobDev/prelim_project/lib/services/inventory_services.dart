import '../models/product.dart';

class InventoryService {
  final List<Product> _products = [];

  // Add a new product to the inventory
  void addProduct(String name, double price, int quantity) {
    // Find the highest existing product ID
    final int newId = _products.isEmpty
        ? 1 // If no products exist, start with ID 1
        : _products
                .map((product) => product.id)
                .reduce((a, b) => a > b ? a : b) +
            1;

    final product = Product(newId, name, price, quantity);
    _products.add(product);
    print('Product added: $product');
  }

  // List all products in the inventory
  void listProducts() {
    if (_products.isEmpty) {
      print('\nNo products in the inventory.');
    } else {
      print('\nListing all products:');
      for (var product in _products) {
        print(product);
      }
    }
  }

  // Update the quantity of a product by its ID
  void updateProductQuantity(int id, int newQuantity) {
    final productToUpdate = _products.firstWhere(
      (product) => product.id == id,
      orElse: () => Product(0, '', 0.0, 0),
    );

    if (productToUpdate.id == 0) {
      print('\nProduct not found.');
    } else {
      productToUpdate.quantity = newQuantity;
      print("");
      print('Product updated: $productToUpdate');
    }
  }

  // Delete a product by ID
  void deleteProduct(int id) {
    final productToDelete = _products.firstWhere(
      (product) => product.id == id,
      orElse: () => Product(0, '', 0.0, 0),
    );

    if (productToDelete.id == 0) {
      print('\nProduct not found.');
    } else {
      _products.remove(productToDelete);
      print('Product deleted: $productToDelete');
    }
  }

  // Search for a product by name
  void searchProductByName(String name) {
    final foundProducts = _products
        .where((product) =>
            product.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    if (foundProducts.isEmpty) {
      print('No products found matching the name "$name".');
    } else {
      print('\nProducts found:');
      for (var product in foundProducts) {
        print(product);
      }
    }
  }
}
