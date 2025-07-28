import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final void Function(String label) onChipSelected;
  final String userName;

  const HomePage({
    super.key,
    required this.onChipSelected,
    required this.userName,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final List<String> explore = [
    "All",
    "Popular",
    "Country",
    "Night",
    "Historical",
    "Mountains",
    "Culture",
    "Dishes"
  ];

  String selectedCategory = "All";

  final List<Map<String, dynamic>> packageItems = [
    {
      "image":
          "https://tse2.mm.bing.net/th/id/OIP.dEPxWNvzHo4AdO0z8g1JdAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title": "Family Tour",
      "Prices": "5000 USD",
      "Packages": "SAARC Tour",
      "type": "Popular"
    },
    {
      "image":
          "https://cda.1001malam.com/uploads/tour/solocitytourpackage2d1n_istanamangkunegaran_1453.JPG",
      "title": "Solo",
      "Prices": "USD 10000",
      "Packages": "1 country",
      "type": "Country"
    },
    {
      "image":
          "https://assets-global.website-files.com/56e9debf633486e330198479/6037da8f9802d561500f9812_group%20travel.jpg",
      "title": "Group Tour",
      "Prices": "USD 40000",
      "Packages": "5 countries",
      "type": "Night"
    },
    {
      "image":
          "https://th.bing.com/th/id/OIP.u9H6hW9Wmg2wJ_wWu3xQxAHaD2?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title": "Companies Tour",
      "Prices": "per individual",
      "Packages": "Specific",
      "type": "Popular"
    },
    {
      "image":
          "https://tse2.mm.bing.net/th/id/OIP.oRu0SxZkb3Tn4MFmrXWp3AHaC5?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title": "VVIP Tour with securities",
      "Prices": "USD 1 Billion",
      "Packages": "VIP Tour",
      "type": "Night"
    },
    {
      "image":
          "https://tse3.mm.bing.net/th/id/OIP.8p6al1cDx6bCBQKMnJKo0wHaEN?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      "title": "Festival and adventure",
      "Prices": "USD 1 Trillion",
      "Packages": "Presidency",
      "type": "Historical"
    }
  ];

  List<Map<String, dynamic>> get filteredPackages {
    if (searchController.text.isNotEmpty) {
      return packageItems
          .where((item) => item["title"]
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    if (selectedCategory == "All") {
      return packageItems;
    }
    return packageItems
        .where((item) => item["type"] == selectedCategory)
        .toList();
  }

  Widget buildChoiceChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: selectedCategory == label,
        onSelected: (_) {
          setState(() {
            selectedCategory = label;
          });
          widget.onChipSelected(label);
        },
      ),
    );
  }

  Widget buildPackageCard(Map<String, dynamic> item) {
    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.network(
              item["image"],
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 230,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item["Packages"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item["title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(item["Prices"],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Explore",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: searchController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: "Search tours, countries...",
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      searchController.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: explore.length,
            itemBuilder: (context, index) => buildChoiceChip(explore[index]),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Filtered Packages",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredPackages.length,
            itemBuilder: (context, index) =>
                buildPackageCard(filteredPackages[index]),
          ),
        ),
      ],
    );
  }
}
