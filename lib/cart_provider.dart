import 'package:flutter/material.dart';
import 'product_list.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0, (total, current) => total + current.price);
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
