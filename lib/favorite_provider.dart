import 'package:flutter/material.dart';
import 'product_list.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favoriteItems = [];

  List<Product> get favoriteItems => _favoriteItems;

  bool isFavorite(Product product) {
    return _favoriteItems.contains(product);
  }

  void addToFavorite(Product product) {
    if (!_favoriteItems.contains(product)) {
      _favoriteItems.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorite(Product product) {
    _favoriteItems.remove(product);
    notifyListeners();
  }
}
