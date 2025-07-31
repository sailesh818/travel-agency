import 'package:flutter/material.dart';
import 'package:travel_agency/agency_dashboard/page/agency_dashboard_page.dart';
import 'package:travel_agency/cart/page/cart_page.dart';
import 'package:travel_agency/country/page/country_page.dart';
import 'package:travel_agency/home/page/home_page.dart';
import 'package:travel_agency/home/widget/app_drawwer_widget.dart';
import 'package:travel_agency/profile/page/profile_page.dart';
import 'package:travel_agency/saved/page/saved_page.dart';

class MainNavigationPage extends StatefulWidget {
  final String role;
  final String userName;
  final String email;

  const MainNavigationPage({
    Key? key,
    required this.role,
    required this.userName,
    required this.email,
  }) : super(key: key);

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(
        userName: widget.userName,
        onChipSelected: (String label) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CountryPage(selected: label)),
          );
        },
      ),
      SavedPage(),
      CartPage(),
      widget.role == 'agency'
          ? AgencyDashboard(email: widget.email)
          : ProfilePage(role: widget.role),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: AppBar(
        title: const Text("Global Travel Agency"),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
