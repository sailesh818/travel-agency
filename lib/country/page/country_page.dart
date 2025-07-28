// CountryPage.dart

import 'package:flutter/material.dart';
import 'package:travel_agency/city/page/city_page.dart';

class CountryPage extends StatefulWidget {
  final String selected;
  const CountryPage({super.key, required this.selected});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final searchController = TextEditingController();

  final List<Map<String, String>> countries = [
    {'name': 'USA', 'flagUrl': 'https://flagcdn.com/w320/us.png'},
    {'name': 'Canada', 'flagUrl': 'https://flagcdn.com/w320/ca.png'},
    {'name': 'India', 'flagUrl': 'https://flagcdn.com/w320/in.png'},
    {'name': 'Germany', 'flagUrl': 'https://flagcdn.com/w320/de.png'},
    {'name': 'Australia', 'flagUrl': 'https://flagcdn.com/w320/au.png'},
    {'name': 'UK', 'flagUrl': 'https://flagcdn.com/w320/gb.png'},
  ];

  List<Map<String, String>> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = List.from(countries);
    searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries.where((country) =>
        country['name']!.toLowerCase().contains(query)).toList();
    });
  }

  void cityPage(String country) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CityPage(country: country)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Countries")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search countries",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => searchController.clear(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredCountries.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final country = filteredCountries[index];
              return GestureDetector(
                onTap: () => cityPage(country["name"]!),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        country["flagUrl"]!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        country["name"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
