import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/profile/widget/profile_action_widget.dart';
import 'package:travel_agency/profile/widget/profile_header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required String role});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? email;
  String? photo;
  bool isloading = true;
  bool isEditing = false;
  int likeCount = 0;

  final usernameController = TextEditingController();

  void incrementLike() {
    setState(() => likeCount++);
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

        if (doc.exists) {
          setState(() {
            usernameController.text = doc['username'];
            email = doc['email'];
            photo = doc['photo'];
            isloading = false;
          });
        } else {
          throw Exception("User document not found");
        }
      } else {
        throw Exception("User not logged in");
      }
    } catch (e) {
      setState(() => isloading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error loading profile: ${e.toString()}")),
      );
    }
  }

  Future<void> updateUserData() async {
    try {
      final newUsername = usernameController.text.trim();
      if (newUsername.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username cannot be empty")),
        );
        return;
      }

      final newPhoto = newUsername[0].toUpperCase();
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'username': newUsername,
        'photo': newPhoto,
      });

      setState(() {
        photo = newPhoto;
        isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ProfileHeaderWidget(
                      photo: photo,
                      email: email,
                      usernameController: usernameController,
                      isEditing: isEditing,
                      onEditTap: () => setState(() => isEditing = true),
                      onSaveTap: updateUserData,
                    ),
                    const SizedBox(height: 20),
                    ProfileActionWidget(
                      likeCount: likeCount,
                      onLikePressed: incrementLike,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}