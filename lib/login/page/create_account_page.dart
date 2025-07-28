import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/home/page/home_page.dart';
import 'package:travel_agency/login/widget/auth_text_field.dart';
import 'package:travel_agency/login/widget/auth_widget.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> create(BuildContext context) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text, 
        password: passwordcontroller.text
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage(onChipSelected: (String label) { }, userName: '',)));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully created account")));

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("UnSuccessfull")));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          AuthTextField(controller: emailcontroller, label: "Email"),
          SizedBox(height: 10,),
          AuthTextField(controller: passwordcontroller, label: "Password", obscure: false),
          const SizedBox(height: 25),
          AuthButton(text: "Create Account", onPressed: () => create(context)),
        ],
      ),
    );
  }
}