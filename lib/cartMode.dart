import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String productName;
  final String productImage;
  final String productPrice;
  int quantity;

  CartItem({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.quantity = 1,
  });
}

class CartModel with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  int get totalPrice => _items.fold(
      0, (sum, item) => sum + (int.parse(item.productPrice) * item.quantity));

  void addItem(CartItem item) {
    final existingItemIndex =
        _items.indexWhere((i) => i.productName == item.productName);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(String productName, int quantity) {
    final existingItemIndex =
        _items.indexWhere((i) => i.productName == productName);
    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity = quantity;
      if (quantity <= 0) {
        _items.removeAt(existingItemIndex);
      }
      notifyListeners();
    }
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item.productName == productName);
    notifyListeners();
  }
}
