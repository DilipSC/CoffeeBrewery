import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Cappuccino',
      description: 'A classic Italian coffee drink prepared with espresso, hot milk, and steamed milk foam.',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Small', 'Medium', 'Large'],
      additives: ['Sugar', 'Cream', 'Cinnamon', 'Chocolate'],
      rating: 4.8,
      reviewCount: 120,
      category: 'Hot Coffee',
      isFeatured: true,
    ),
    Product(
      id: '2',
      name: 'Caramel Macchiato',
      description: 'A sweet coffee drink made with espresso, caramel, and foamed milk.',
      price: 5.49,
      imageUrl: 'https://images.unsplash.com/photo-1587080413959-06b859fb107d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Small', 'Medium', 'Large'],
      additives: ['Sugar', 'Cream', 'Caramel', 'Vanilla'],
      rating: 4.7,
      reviewCount: 98,
      category: 'Hot Coffee',
      isFeatured: true,
    ),
    Product(
      id: '3',
      name: 'Iced Americano',
      description: 'Espresso shots topped with cold water to produce a light layer of crema, served over ice.',
      price: 3.99,
      imageUrl: 'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Small', 'Medium', 'Large'],
      additives: ['Sugar', 'Cream', 'Vanilla'],
      rating: 4.5,
      reviewCount: 75,
      category: 'Cold Coffee',
      isFeatured: false,
    ),
    Product(
      id: '4',
      name: 'Mocha Frappuccino',
      description: 'Coffee blended with ice and mocha sauce, topped with whipped cream.',
      price: 5.99,
      imageUrl: 'https://images.unsplash.com/photo-1577968897966-3d4325b36b61?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Small', 'Medium', 'Large'],
      additives: ['Whipped Cream', 'Chocolate Chips', 'Caramel Drizzle'],
      rating: 4.9,
      reviewCount: 150,
      category: 'Cold Coffee',
      isFeatured: true,
    ),
    Product(
      id: '5',
      name: 'Espresso',
      description: 'A concentrated form of coffee served in small, strong shots.',
      price: 2.99,
      imageUrl: 'https://images.unsplash.com/photo-1510707577719-ae7f89c4d3f9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Single', 'Double'],
      additives: ['Sugar'],
      rating: 4.6,
      reviewCount: 85,
      category: 'Hot Coffee',
      isFeatured: false,
    ),
    Product(
      id: '6',
      name: 'Chai Tea Latte',
      description: 'Black tea infused with cinnamon, clove, and other warming spices combined with steamed milk.',
      price: 4.49,
      imageUrl: 'https://images.unsplash.com/photo-1589213987417-13c09b540b54?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      sizes: ['Small', 'Medium', 'Large'],
      additives: ['Sugar', 'Honey', 'Cinnamon'],
      rating: 4.7,
      reviewCount: 92,
      category: 'Tea',
      isFeatured: false,
    ),
  ];

  List<Product> get products => [..._products];
  
  List<Product> get featuredProducts => _products.where((product) => product.isFeatured).toList();
  
  List<String> get categories {
    final Set<String> categoriesSet = _products.map((product) => product.category).toSet();
    return categoriesSet.toList();
  }
  
  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }
  
  Product getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
  
  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [];
    }
    return _products.where((product) => 
      product.name.toLowerCase().contains(query.toLowerCase()) ||
      product.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
