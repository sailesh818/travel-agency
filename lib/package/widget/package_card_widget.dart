import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  final Map<String, dynamic> pkg;
  final Widget imageWidget;

  const PackageCard({super.key, required this.pkg, required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: pkg['image'] != null && pkg['image'].toString().isNotEmpty
                ? imageWidget
                : const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(pkg['title'] ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          if (pkg['price'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("Rs. ${pkg['price']}"),
            ),
        ],
      ),
    );
  }
}