import 'package:flutter/material.dart';
import 'package:travel_agency/db/database_helper.dart';

class HomeController with ChangeNotifier {
  final List<String> explore = [
    "All", "Popular", "Country", "Night", "Historical", "Mountains", "Culture", "Dishes"
  ];

  String selectedCategory = "All";
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> localPackages = [];

  final List<Map<String, dynamic>> packageItems = [
  ];

  List<Map<String, dynamic>> get filteredPackages {
    final text = searchController.text.toLowerCase();
    if (text.isNotEmpty) {
      return packageItems
          .where((item) => item["title"].toLowerCase().contains(text))
          .toList();
    }
    if (selectedCategory == "All") return packageItems;
    return packageItems.where((item) => item["type"] == selectedCategory).toList();
  }

  void updateCategory(String label) {
    selectedCategory = label;
    notifyListeners();
  }

  Future<void> loadLocalPackages() async {
    final db = await DatabaseHelper.instance.db;
    final result = await db.query('packages', limit: 6);
    localPackages = result.map((pkg) => {
      "title": pkg["title"],
      "image": pkg["image"],
      "Prices": pkg["price"],
      "Packages": pkg["description"],
      "type": pkg["type"] ?? "All"
    }).toList();
    notifyListeners();
  }

  void selectCategory(String explore) {}
}
