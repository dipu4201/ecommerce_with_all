import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  int get cartCount => _cartItems.length;

  double get totalAmount =>
      _cartItems.fold(0, (sum, item) => sum + item.price);
}
