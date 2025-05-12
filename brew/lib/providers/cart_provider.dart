import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  
  List<CartItem> get items => [..._items];
  
  int get itemCount => _items.length;
  
  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
  
  void addItem(Product product, String selectedSize, List<String> selectedAdditives) {
    final existingIndex = _items.indexWhere((item) => 
      item.product.id == product.id && 
      item.selectedSize == selectedSize &&
      _listEquals(item.selectedAdditives, selectedAdditives)
    );
    
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += 1;
    } else {
      _items.add(
        CartItem(
          product: product,
          selectedSize: selectedSize,
          selectedAdditives: selectedAdditives,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
  
  void removeItem(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }
  
  void updateQuantity(CartItem cartItem, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(cartItem);
    } else {
      final index = _items.indexOf(cartItem);
      if (index >= 0) {
        _items[index].quantity = newQuantity;
        notifyListeners();
      }
    }
  }
  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
  
  bool _listEquals<T>(List<T> list1, List<T> list2) {
    if (list1.length != list2.length) return false;
    for (var i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }
  
  Future<Order> placeOrder(String userId, String deliveryAddress) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      items: [..._items],
      totalAmount: totalAmount,
      status: 'Pending',
      orderDate: DateTime.now(),
      deliveryAddress: deliveryAddress,
    );
    
    clearCart();
    return order;
  }
}
