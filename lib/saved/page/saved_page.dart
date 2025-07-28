import 'package:flutter/material.dart';
import 'package:travel_agency/packages/page/packages_detail_page.dart';
//import 'package:travel_agency/travel/page/package_detail_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> savedPackages = [
      {
        "title": "Adventure in Nepal",
        "image": "https://tse1.mm.bing.net/th/id/OIP.dEDMRfnEPXgqdZEr0yrSHQHaE7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
        "type": "Adventure",
        "description": "Explore thrilling adventures in the heart of Nepal.",
        "city": "Kathmandu"
      },
      {
        "title": "Historical Egypt",
        "image": "https://th.bing.com/th/id/R.7e6f538ada06d0d7f28bf02c66a42cea?rik=EKjh%2b9BgT0%2bYPQ&pid=ImgRaw&r=0",
        "type": "Historical",
        "description": "Discover the wonders of ancient Egypt and its timeless pyramids.",
        "city": "Cairo"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Saved Packages")),
      body: savedPackages.isEmpty
          ? const Center(child: Text("No saved packages yet."))
          : ListView.builder(
              itemCount: savedPackages.length,
              itemBuilder: (context, index) {
                final item = savedPackages[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(item['image']!, width: 60, fit: BoxFit.cover),
                    title: Text(item['title']!),
                    subtitle: Text(item['type']!),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PackageDetailPage(
                            title: item['title']!,
                            imageUrl: item['image']!,
                            type: item['type']!,
                            description: item['description']!,
                            city: item['city']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
