import 'package:flutter/material.dart';
import 'package:travel_agency/package/page/package_detail_page.dart';

class SavedPackageCard extends StatelessWidget {
  final Map<String, String> packageData;

  const SavedPackageCard({super.key, required this.packageData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(
          packageData['image'] ?? '',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
        ),
        title: Text(packageData['title'] ?? ''),
        subtitle: Text(packageData['type'] ?? ''),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PackageDetailPage(packageData: packageData),
            ),
          );
        },
      ),
    );
  }
}
