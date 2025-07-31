import 'dart:io';
import 'package:flutter/material.dart';

class AgencyPackageCard extends StatelessWidget {
  final Map<String, dynamic> pkg;
  final VoidCallback onTap;

  const AgencyPackageCard({super.key, required this.pkg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: pkg['image'] != null && pkg['image'].toString().isNotEmpty
            ? Image.file(
                File(pkg['image']),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.image, size: 60),
        title: Text(pkg['title'] ?? ''),
        subtitle: Text(pkg['destination'] ?? ''),
        onTap: onTap,
      ),
    );
  }
}

