import 'package:flutter/material.dart';

class CityController with ChangeNotifier {
  final Map<String, List<Map<String, String>>> _cities = {
  };

  List<Map<String, String>> getCitiesByCountry(String country) {
    return _cities[country] ?? [];
  }
}
