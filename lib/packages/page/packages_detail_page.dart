import 'package:flutter/material.dart';

class PackageDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String type;
  final String city;

  const PackageDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.type,
    required this.city,
  });

  @override
  State<PackageDetailPage> createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  bool isSaved = false;
  bool isInCart = false;

  final List<Map<String, String>> nearbyPackages = [
    {
      'title': 'Swayambhu Tour',
      'imageUrl': 'https://www.amazingkathmandu.com/wp-content/uploads/2023/04/Swayambhu00-1024x646-1.jpg',
    },
    {
      'title': 'Kathmandu Durbar Square',
      'imageUrl': 'https://tse3.mm.bing.net/th/id/OIP.k5QCJk2uZOtGHewY3oEoMgHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
    },
  ];

  void toggleSave() {
    setState(() => isSaved = !isSaved);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isSaved ? 'Saved to favorites' : 'Removed from favorites'),
      ),
    );
  }

  void toggleCart() {
    setState(() => isInCart = !isInCart);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isInCart ? 'Added to cart' : 'Removed from cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(isSaved ? Icons.favorite : Icons.favorite_border),
            tooltip: "Save",
            onPressed: toggleSave,
          ),
          IconButton(
            icon: Icon(isInCart ? Icons.shopping_cart : Icons.add_shopping_cart),
            tooltip: "Add to Cart",
            onPressed: toggleCart,
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            widget.imageUrl,
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text("Type: ${widget.type}", style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                Text(widget.description),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.payment),
                  label: const Text("Buy Package"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Purchased ${widget.title}")),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Text("Other Popular Packages in ${widget.city}", style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                ...nearbyPackages.map((place) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.network(place['imageUrl']!, width: 60, height: 60, fit: BoxFit.cover),
                        title: Text(place['title']!),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
