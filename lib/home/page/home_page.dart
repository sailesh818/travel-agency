import 'package:flutter/material.dart';
import 'package:travel_agency/home/widget/app_drawwer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: AppBar(
        title: Row(
        children: [
          Text("Home Page"),
          SizedBox(width: 20,),
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.create))
      ],
      ),
      
      body: Center(child: Text("Welcome home"),
      )
    );
  }
}