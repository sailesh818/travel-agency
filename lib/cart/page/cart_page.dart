import 'package:flutter/material.dart';
import 'package:travel_agency/packages/page/packages_detail_page.dart';
//import 'package:travel_agency/travel/page/package_detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "title": "Kathmandu Historical Tour",
      "price": 120.0,
      "image": "https://tse4.mm.bing.net/th/id/OIP.nyQdtZ15StgBRZfm4EL3lAHaDl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "type": "Historical",
      "description": "A deep dive into Kathmandu's ancient culture.",
      "city": "Kathmandu",
    },
    {
      "title": "Canadian Rockies Adventure",
      "price": 250.0,
      "image": "https://tse4.mm.bing.net/th/id/OIP.Cayq3fXaIVYLvmxLriqgQQHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "type": "Adventure",
      "description": "Experience the majestic Rockies with this thrilling package.",
      "city": "Banff",
    },
  ];

  double get total => cartItems.fold(0, (sum, item) => sum + item["price"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty."))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PackageDetailPage(
                                  title: item['title'],
                                  imageUrl: item['image'],
                                  description: item['description'],
                                  type: item['type'],
                                  city: item['city'],
                                ),
                              ),
                            );
                          },
                          leading: Image.network(item['image'], width: 60, fit: BoxFit.cover),
                          title: Text(item['title']),
                          subtitle: Text("\$${item['price']}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total: \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Proceeding to checkout...")),
                      );
                    },
                    child: const Text("Checkout"),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
