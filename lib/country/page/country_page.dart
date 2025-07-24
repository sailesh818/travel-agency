import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Country"),),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}