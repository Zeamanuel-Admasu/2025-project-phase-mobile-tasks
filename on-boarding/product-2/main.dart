import 'dart:io';

class Product {
  String _name;
  String _description;
  double _price;

  Product(this._name, this._description, this._price);

  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String value) => _name = value;
  set description(String value) => _description = value;
  set price(double value) => _price = value;

  void display(int index) {
    print(
        '[$index] Name: $_name | Description: $_description | Price: \$$_price');
  }
}

class ProductManager {
  final List<Product> _products = [];

  void addProduct() {
    stdout.write('Enter product name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Enter product description: ');
    String description = stdin.readLineSync()!;
    stdout.write('Enter product price: ');
    double? price = double.tryParse(stdin.readLineSync()!);

    if (price == null) {
      print('Invalid price. Product not added.');
      return;
    }

    _products.add(Product(name, description, price));
    print('Product added successfully.');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
      return;
    }

    for (int i = 0; i < _products.length; i++) {
      _products[i].display(i);
    }
  }

  void viewProduct() {
    stdout.write('Enter product index to view: ');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 0 || index >= _products.length) {
      print('Invalid index.');
      return;
    }

    _products[index].display(index);
  }

  void editProduct() {
    stdout.write('Enter product index to edit: ');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 0 || index >= _products.length) {
      print('Invalid index.');
      return;
    }

    stdout.write('Enter new name (leave blank to keep current): ');
    String name = stdin.readLineSync()!;
    stdout.write('Enter new description (leave blank to keep current): ');
    String description = stdin.readLineSync()!;
    stdout.write('Enter new price (leave blank to keep current): ');
    String priceInput = stdin.readLineSync()!;

    if (name.isNotEmpty) _products[index].name = name;
    if (description.isNotEmpty) _products[index].description = description;
    if (priceInput.isNotEmpty) {
      double? price = double.tryParse(priceInput);
      if (price != null) {
        _products[index].price = price;
      } else {
        print('Invalid price, keeping old price.');
      }
    }

    print('Product updated.');
  }

  void deleteProduct() {
    stdout.write('Enter product index to delete: ');
    int? index = int.tryParse(stdin.readLineSync()!);
    if (index == null || index < 0 || index >= _products.length) {
      print('Invalid index.');
      return;
    }

    _products.removeAt(index);
    print('Product deleted.');
  }
}

void main() {
  final manager = ProductManager();

  while (true) {
    print('\nChoose from all this');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Single Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');

    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewAllProducts();
        break;
      case '3':
        manager.viewProduct();
        break;
      case '4':
        manager.editProduct();
        break;
      case '5':
        manager.deleteProduct();
        break;
      case '6':
        print('Goodbye!');
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}
