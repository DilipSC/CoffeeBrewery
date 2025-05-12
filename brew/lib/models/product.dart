class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> sizes;
  final List<String> additives;
  final double rating;
  final int reviewCount;
  final String category;
  final bool isFeatured;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.additives,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.category,
    this.isFeatured = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      sizes: List<String>.from(json['sizes']),
      additives: List<String>.from(json['additives']),
      rating: json['rating']?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      category: json['category'],
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'sizes': sizes,
      'additives': additives,
      'rating': rating,
      'reviewCount': reviewCount,
      'category': category,
      'isFeatured': isFeatured,
    };
  }
}

class CartItem {
  final Product product;
  final String selectedSize;
  final List<String> selectedAdditives;
  int quantity;

  CartItem({
    required this.product,
    required this.selectedSize,
    required this.selectedAdditives,
    this.quantity = 1,
  });

  double get totalPrice {
    double additionalPrice = 0;
    if (selectedSize == 'Medium') additionalPrice += 0.5;
    if (selectedSize == 'Large') additionalPrice += 1.0;
    
    return (product.price + additionalPrice) * quantity;
  }
}

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double totalAmount;
  final String status;
  final DateTime orderDate;
  final String deliveryAddress;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
    required this.deliveryAddress,
  });
}
