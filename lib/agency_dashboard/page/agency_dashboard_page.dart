import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_agency/agency_dashboard/controller/agency_dashboard_controller.dart';
import 'package:travel_agency/agency_dashboard/widget/package_card_widget.dart';
import 'package:travel_agency/agency_dashboard/widget/profile_section_widget.dart';
import 'package:travel_agency/package/page/create_package.dart';
import 'package:travel_agency/package/page/package_detail_page.dart';
import 'package:travel_agency/login/page/agency_auth_page.dart';
import 'package:travel_agency/package/page/all_package_page.dart';

class AgencyDashboard extends StatefulWidget {
  final String email;
  const AgencyDashboard({super.key, required this.email});

  @override
  State<AgencyDashboard> createState() => _AgencyDashboardState();
}

class _AgencyDashboardState extends State<AgencyDashboard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AgencyDashboardController>(context, listen: false)
            .loadPackages());
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AgencyDashboardController>(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ProfileSectionWidget(email: widget.email),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Create Travel Package"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () async {
              final result = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatePackagePage(email: widget.email),
                ),
              );
              if (result == true) {
                await controller.loadPackages();
              }
            },
          ),
          const SizedBox(height: 24),
          const Text(
            "Our Packages",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (controller.packages.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("No packages yet"),
              ),
            )
          else
            ...controller.packages.map((pkg) => AgencyPackageCard(
                  pkg: pkg,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PackageDetailPage(packageId: pkg['id']),
                      ),
                    );
                  },
                )),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AllPackagesPage()),
              );
            },
            child: const Text("View All Packages"),
          ),
          const SizedBox(height: 16),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const AuthPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
