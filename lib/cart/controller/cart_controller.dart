import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [
    {
      "title": "Kathmandu Historical Tour",
      "price": 120.0,
      "image":
          "https://tse4.mm.bing.net/th/id/OIP.nyQdtZ15StgBRZfm4EL3lAHaDl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "type": "Historical",
      "description": "A deep dive into Kathmandu's ancient culture.",
      "city": "Kathmandu",
    },
    {
      "title": "Canadian Rockies Adventure",
      "price": 250.0,
      "image":
          "https://tse4.mm.bing.net/th/id/OIP.Cayq3fXaIVYLvmxLriqgQQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "type": "Adventure",
      "description": "Experience the majestic Rockies with this thrilling package.",
      "city": "Banff",
    },
  ];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get total =>
      _cartItems.fold(0.0, (sum, item) => sum + (item["price"] ?? 0.0));

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }
}
