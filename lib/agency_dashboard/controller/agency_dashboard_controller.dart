import 'package:flutter/material.dart';
import 'package:travel_agency/db/database_helper.dart';

class AgencyDashboardController extends ChangeNotifier {
  List<Map<String, dynamic>> _packages = [];

  List<Map<String, dynamic>> get packages => _packages;

  Future<void> loadPackages() async {
    _packages = await DatabaseHelper.instance.getAllPackages();
    notifyListeners();
  }
}
