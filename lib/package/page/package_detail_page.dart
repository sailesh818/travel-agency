import 'dart:io';
import 'package:flutter/material.dart';
import '../../db/database_helper.dart';

class PackageDetailPage extends StatefulWidget {
  final int? packageId;
  final Map<String, dynamic>? packageData;

  PackageDetailPage({this.packageId, this.packageData})
      : assert(packageId != null || packageData != null,
            'Either packageId or packageData must be provided');

  @override
  _PackageDetailPageState createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  Map<String, dynamic>? pkg;
  bool loading = true;

  final List<Map<String, dynamic>> savedPackages = [];
  final List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.packageData != null) {
      pkg = widget.packageData!;
      loading = false;
    } else {
      _loadPackage();
    }
  }

  Future<void> _loadPackage() async {
    final data = await DatabaseHelper.instance.getPackageById(widget.packageId!);
    setState(() {
      pkg = data;
      loading = false;
    });
  }

  void _savePackage() {
    setState(() {
      savedPackages.add(pkg!);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Package saved successfully')),
    );
  }

  void _addToCart() {
    setState(() {
      cartItems.add(pkg!);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (pkg == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("Package not found.")),
      );
    }

    final isNetworkImage = pkg!['image'] != null &&
        pkg!['image'].toString().startsWith('http');

    return Scaffold(
      appBar: AppBar(title: Text(pkg!['title'] ?? '')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pkg!['image'] != null && pkg!['image'].toString().isNotEmpty
                ? isNetworkImage
                    ? Image.network(
                        pkg!['image'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, size: 80),
                        ),
                      )
                    : Image.file(
                        File(pkg!['image']),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                : Container(
                    color: Colors.grey[300],
                    height: 200,
                    child: const Center(child: Icon(Icons.image, size: 80)),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pkg!['title'] ?? '',
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  if (pkg!['destination'] != null)
                    Text(pkg!['destination'] ?? '',
                        style: const TextStyle(fontSize: 18)),
                  if (pkg!['city'] != null) ...[
                    const SizedBox(height: 8),
                    Text("City: ${pkg!['city']}")
                  ],
                  if (pkg!['type'] != null) ...[
                    const SizedBox(height: 8),
                    Text("Type: ${pkg!['type']}")
                  ],
                  if (pkg!['price'] != null) ...[
                    const SizedBox(height: 8),
                    Text("Price: \$${pkg!['price']}")
                  ],
                  const SizedBox(height: 8),
                  Text(pkg!['description'] ?? '',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _savePackage,
                        icon: const Icon(Icons.favorite_border),
                        label: const Text("Save"),
                      ),
                      ElevatedButton.icon(
                        onPressed: _addToCart,
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text("Add to Cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
