import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String? photo;
  final String? email;
  final TextEditingController usernameController;
  final bool isEditing;
  final VoidCallback onEditTap;
  final VoidCallback onSaveTap;

  const ProfileHeaderWidget({
    super.key,
    required this.photo,
    required this.email,
    required this.usernameController,
    required this.isEditing,
    required this.onEditTap,
    required this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
            photo ?? "?",
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(height: 20),
        isEditing
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: usernameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelText: "Edit Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: onSaveTap,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    usernameController.text,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onEditTap,
                  ),
                ],
              ),
        const SizedBox(height: 10),
        Text(
          email ?? "No Email",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}