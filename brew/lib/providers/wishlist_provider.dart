import 'package:flutter/material.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _items = [];
  
  List<Product> get items => [..._items];
  
  int get itemCount => _items.length;
  
  bool isInWishlist(String productId) {
    return _items.any((item) => item.id == productId);
  }
  
  void addItem(Product product) {
    if (!isInWishlist(product.id)) {
      _items.add(product);
      notifyListeners();
    }
  }
  
  void removeItem(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }
  
  void toggleWishlistStatus(Product product) {
    if (isInWishlist(product.id)) {
      removeItem(product.id);
    } else {
      addItem(product);
    }
  }
}
