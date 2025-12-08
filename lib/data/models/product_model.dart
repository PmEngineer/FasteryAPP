// lib/models/product_model.dart

class Product {
  final String title;
  final String description;
  final String weight;
  final String price; // Should be a number type in a real app, using String for consistency with your widget
  final String originalPrice;
  final String discount;
  final String imageUrl;
  final bool isBestseller;

  Product({
    required this.title,
    required this.description,
    required this.weight,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.imageUrl,
    this.isBestseller = false,
  });

  // Helper method to create a Product from the ProductCard's required fields
  factory Product.fromCard({
    required String title,
    required String description,
    required String weight,
    required String price,
    required String originalPrice,
    required String discount,
    required String imageUrl,
    bool isBestseller = false,
  }) {
    return Product(
      title: title,
      description: description,
      weight: weight,
      price: price,
      originalPrice: originalPrice,
      discount: discount,
      imageUrl: imageUrl,
      isBestseller: isBestseller,
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              title == other.title; // Using title as a unique ID for simplicity

  @override
  int get hashCode => title.hashCode;
}



// A simple model for a cart item, including quantity
class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}