import 'package:riverpod/riverpod.dart';
import 'services/inventory_services.dart';
import 'dart:io';

// Provider for InventoryService
final inventoryServiceProvider = Provider((ref) => InventoryService());

void main() {
  final container = ProviderContainer();
  final inventoryService = container.read(inventoryServiceProvider);

  print('Welcome to the Inventory Management System!');

  while (true) {
    print('\nSelect an option:');
    print('1. Add Product');
    print('2. List Products');
    print('3. Update Product Quantity');
    print('4. Delete Product');
    print('5. Search Product by Name');
    print('6. Exit');

    print("");
    var choice = stdin.readLineSync();
    print("");

    switch (choice) {
      case '1':
        print('Enter product name:');
        var name = stdin.readLineSync() ?? '';
        print('Enter product price:');
        var price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        print('Enter product quantity:');
        var quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        inventoryService.addProduct(name, price, quantity);
        break;

      case '2':
        inventoryService.listProducts();
        break;

      case '3':
        print('Enter product ID:');
        var id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        print('Enter new quantity:');
        var newQuantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        inventoryService.updateProductQuantity(id, newQuantity);
        break;

      case '4':
        print('Enter product ID:');
        var idToDelete = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        inventoryService.deleteProduct(idToDelete);
        break;

      case '5':
        print('Enter product name:');
        var nameToSearch = stdin.readLineSync() ?? '';
        inventoryService.searchProductByName(nameToSearch);
        break;

      case '6':
        print('Exiting...');
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
