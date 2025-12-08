// lib/cart/controllers/cart_controller.dart (FULL UPDATED CODE)

import 'package:get/get.dart';
import '../../../data/models/product_model.dart'; // Ensure this path is correct

// --- Constants for Fee Calculation ---
// Define these constants outside or inside the class, but they need to be accessible.
const double DELIVERY_FEE_THRESHOLD = 500.0;
const double BASE_DELIVERY_FEE = 30.0;
const double BASE_HANDLING_FEE = 10.0; // The fee the user is 'saved'
const double GST_RATE = 0.05; // 5% GST

class CartController extends GetxController {
  // Observable list to hold the cart items
  final cartItems = <CartItem>[].obs;

  /// Adds a product to the cart or increments its quantity if it already exists.
  void addItemToCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product == product);

    if (index != -1) {
      CartItem existingItem = cartItems[index];
      cartItems[index] = existingItem.copyWith(quantity: existingItem.quantity + 1);
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
  }

  /// Removes a product from the cart or decrements its quantity.
  void removeItemFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product == product);

    if (index != -1) {
      CartItem existingItem = cartItems[index];

      if (existingItem.quantity > 1) {
        cartItems[index] = existingItem.copyWith(quantity: existingItem.quantity - 1);
      } else {
        cartItems.removeAt(index);
      }
    }
  }

  // --- Utility Getters ---

  int getProductQuantity(Product product) {
    final item = cartItems.firstWhereOrNull((item) => item.product == product);
    return item?.quantity ?? 0;
  }

  int get totalUniqueItems => cartItems.length;

  // --- Core Calculation Properties ---

  // 1. Item Total Price based on current selling price (Subtotal)
  double get subtotal {
    double total = 0.0;
    for (var item in cartItems) {
      try {
        double price = double.parse(item.product.price);
        total += price * item.quantity;
      } catch (_) {}
    }
    return total;
  }

  // 2. Total Price based on MRP (Original Total)
  double get totalMRP {
    double total = 0.0;
    for (var item in cartItems) {
      try {
        double mrp = double.parse(item.product.originalPrice);
        total += mrp * item.quantity;
      } catch (_) {}
    }
    return total;
  }

  // 3. Delivery Fee Logic
  double get deliveryFee {
    // Delivery is free if subtotal exceeds the threshold
    return subtotal >= DELIVERY_FEE_THRESHOLD ? 0.0 : BASE_DELIVERY_FEE;
  }

  // 4. Handling Fee (Currently set to 0.0, implying it's 'free')
  double get handlingFee => 0.0;

  // 5. GST Charges (Calculated on the selling price (Subtotal) + paid Delivery Fee)
  double get gstCharges {
    // GST is calculated on (Subtotal + Paid Delivery Fee) * GST_RATE
    return (subtotal + deliveryFee) * GST_RATE;
  }

  // 6. Final Grand Total To Pay
  double get grandTotal {
    return subtotal + deliveryFee + handlingFee + gstCharges;
  }

  // --- Savings & Comparison Properties ---

  // 7. Savings from Item Discounts (Discount on MRP)
  double get itemDiscountSavings => totalMRP - subtotal;

  // 8. Savings on Handling Fee (The original fee that was waived)
  double get handlingFeeSavings => BASE_HANDLING_FEE;

  // 9. Savings on Delivery Fee (The base fee that was waived if free delivery applies)
  double get deliveryFeeSavings {
    // BASE_DELIVERY_FEE - deliveryFee (0.0 if free, 30.0 if paid)
    return BASE_DELIVERY_FEE - deliveryFee;
  }

  // 10. Total Savings (Item Discount + Handling Fee Savings + Delivery Fee Savings)
  double get totalSavings {
    return itemDiscountSavings + handlingFeeSavings + deliveryFeeSavings;
  }

  // 11. Total Price To Pay (Original value for strikethrough text on final bill summary)
  double get totalToPayBeforeSavings {
    // Total MRP + Base Delivery + Base Handling + GST on those
    return totalMRP + BASE_DELIVERY_FEE + BASE_HANDLING_FEE + ((totalMRP + BASE_DELIVERY_FEE + BASE_HANDLING_FEE) * GST_RATE);
  }

  // 12. Free Delivery Message for BillSummaryOverview
  String get freeDeliveryMessage {
    if (deliveryFee == 0.0) {
      return 'Free Delivery Applied!';
    }
    final amountToSpend = DELIVERY_FEE_THRESHOLD - subtotal;
    // Ensure the message shows 0 if subtotal is already close to or over the threshold
    if (amountToSpend <= 0) return 'Free Delivery Applied!';

    return 'Add products worth ₹${amountToSpend.toStringAsFixed(0)} to get free delivery';
  }
}