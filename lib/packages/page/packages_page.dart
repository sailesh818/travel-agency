import 'package:flutter/material.dart';
import 'package:travel_agency/packages/page/packages_detail_page.dart';

class TravelPage extends StatelessWidget {
  final String country;
  final String city;

  TravelPage({required this.country, required this.city});

  final List<Map<String, String>> travelPackages = [
    {
      'title': 'Pashupati Tour',
      'type': 'Historical',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/2/27/Pashupatinath_Temple%2C_Kathmandu.jpg',
      'description': 'Visit the famous Pashupatinath Temple in Kathmandu.'
    },
    {
      'title': 'Adventure in Shivapuri',
      'type': 'Adventure',
      'imageUrl': 'https://nepalhikingteam.com/wp-content/uploads/2020/06/Shivapuri.jpg',
      'description': 'Trek through the beautiful Shivapuri National Park.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$city Packages')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Packages", style: Theme.of(context).textTheme.titleLarge),
          ),
          ...travelPackages.map((pkg) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PackageDetailPage(
                        title: pkg['title']!,
                        imageUrl: pkg['imageUrl']!,
                        description: pkg['description']!,
                        type: pkg['type']!,
                        city: city,
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Image.network(pkg['imageUrl']!, height: 200, width: double.infinity, fit: BoxFit.cover),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pkg['title']!, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                            Text(pkg['type']!, style: const TextStyle(fontSize: 14, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
