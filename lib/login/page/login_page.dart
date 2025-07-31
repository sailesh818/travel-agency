import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/login/page/agency_auth_page.dart';
import 'package:travel_agency/login/page/create_account_page.dart';
import 'package:travel_agency/login/page/forgot_password.dart';
import 'package:travel_agency/login/widget/auth_text_field.dart';
import 'package:travel_agency/login/widget/auth_widget.dart';
import 'package:travel_agency/navigation/page/navigation_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
      User? user = userCredential.user;
      if (user != null) {
        final uid = user.uid;
        final email = user.email ?? "";
        final username = email.split('@')[0];
        final photo = username.isNotEmpty ? username[0].toUpperCase() : "?";

        final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
        final docSnapshot = await userDoc.get();

        if (!docSnapshot.exists) {
          await userDoc.set({
            'email': email,
            'username': username,
            'photo': photo,
            'createdAt': Timestamp.now(),
            'role': 'user',
          });
        }
        final role = docSnapshot.data()?['role'] ?? 'user';
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => MainNavigationPage(
              role: role,
              userName: username,
              email: email,
            ),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Successful login")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AuthTextField(controller: emailcontroller, label: "Email"),
          const SizedBox(height: 10),
          AuthTextField(controller: passwordcontroller, label: "Password", obscure: true),
          Padding(
            padding: const EdgeInsets.only(left: 200, top: 4),
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordPage())),
              child: const Text("Forgot Password", style: TextStyle(color: Colors.blue)),
            ),
          ),
          const SizedBox(height: 10),
          AuthButton(text: "Login", onPressed: () => login(context)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Are you new? "),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CreateAccountPage()));
                },
                child: const Text("Create Account", style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Are you travel agency? "),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AuthPage()));
                },
                child: const Text("SignIn here", style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
