import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_agency/cart/controller/cart_controller.dart';
import 'package:travel_agency/package/page/package_detail_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Consumer<CartController>(
        builder: (context, cart, _) {
          return Column(
            children: [
              Expanded(
                child: cart.cartItems.isEmpty
                    ? const Center(child: Text("Your cart is empty."))
                    : ListView.builder(
                        itemCount: cart.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cart.cartItems[index];
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.network(
                                item['image'],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.broken_image, size: 60),
                              ),
                              title: Text(item['title']),
                              subtitle: Text("\$${item['price']}"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cart.removeItem(index);
                                },
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PackageDetailPage(packageData: {
                                      'title': item['title'],
                                      'image': item['image'],
                                      'description': item['description'],
                                      'type': item['type'],
                                      'city': item['city'],
                                      'price': item['price'].toString(),
                                    }),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
              if (cart.cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${cart.total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
          );
        },
      ),
    );
  }
}
