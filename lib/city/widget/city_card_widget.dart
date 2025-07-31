
import 'package:flutter/material.dart';

class CityCardWidget extends StatelessWidget {
  final String cityName;
  final String imageUrl;

  const CityCardWidget({
    super.key,
    required this.cityName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
              const Center(child: Icon(Icons.image_not_supported)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Text(
              cityName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black87,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
