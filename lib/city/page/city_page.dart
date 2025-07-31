import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_agency/city/controller/city_controller.dart';
import 'package:travel_agency/city/widget/city_card_widget.dart';

class CityPage extends StatelessWidget {
  final String country;

  CityPage({required this.country});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CityController>(context);
    final countryCities = controller.getCitiesByCountry(country);

    return Scaffold(
      appBar: AppBar(title: Text("$country Cities")),
      body: countryCities.isEmpty
          ? Center(child: Text("No cities available"))
          : ListView.builder(
              itemCount: countryCities.length,
              itemBuilder: (context, index) {
                final city = countryCities[index];
                return GestureDetector(
                  onTap: () {
                  },
                  child: CityCardWidget(
                    cityName: city["name"]!,
                    imageUrl: city["imageUrl"]!,
                  ),
                );
              },
            ),
    );
  }
}
