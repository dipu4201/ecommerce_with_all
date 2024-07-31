// // providers/favorite_provider.dart
// import 'package:flutter/material.dart';
// import '../models/product.dart';
//
// class FavoriteProvider with ChangeNotifier {
//   List<Product> _favoriteProducts = [];
//
//   List<Product> get favoriteProducts => _favoriteProducts;
//
//   void addFavorite(Product product) {
//     _favoriteProducts.add(product);
//     notifyListeners();
//   }
//
//   void removeFavorite(Product product) {
//     _favoriteProducts.remove(product);
//     notifyListeners();
//   }
//
//   bool isFavorite(Product product) {
//     return _favoriteProducts.contains(product);
//   }
//
//   int get favoriteCount => _favoriteProducts.length;
// }


import 'package:flutter/material.dart';
import 'package:untitled/models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];
  List<Product> _cartProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;
  List<Product> get cartProducts => _cartProducts;

  int get favoriteCount => _favoriteProducts.length;
  int get cartCount => _cartProducts.length;

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }

  bool isInCart(Product product) {
    return _cartProducts.contains(product);
  }

  void addToFavorites(Product product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }

  void addToCart(Product product) {
    if (!_cartProducts.contains(product)) {
      _cartProducts.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }
}

