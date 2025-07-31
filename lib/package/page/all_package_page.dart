import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/db/database_helper.dart';
import 'package:travel_agency/package/widget/package_card_widget.dart';

class AllPackagesPage extends StatefulWidget {
  @override
  State<AllPackagesPage> createState() => _AllPackagesPageState();
}

class _AllPackagesPageState extends State<AllPackagesPage> {
  List<Map<String, dynamic>> _packages = [];

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }

  Future<void> _loadPackages() async {
    final data = await DatabaseHelper.instance.getAllPackages();
    setState(() => _packages = data);
  }

  Widget _buildImage(String imagePath) {
    if (kIsWeb) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      );
    } else {
      final file = io.File(imagePath);
      if (file.existsSync()) {
        return Image.file(file, fit: BoxFit.cover);
      } else {
        return const Icon(Icons.broken_image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Travel Packages")),
      body: _packages.isEmpty
          ? const Center(child: Text("No packages available"))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _packages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final pkg = _packages[index];
                final imageWidget = pkg['image'] != null &&
                        pkg['image'].toString().isNotEmpty
                    ? _buildImage(pkg['image'])
                    : const Center(child: Icon(Icons.image, size: 60));
                return PackageCard(pkg: pkg, imageWidget: imageWidget);
              },
            ),
    );
  }
}