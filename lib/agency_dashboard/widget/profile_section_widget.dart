import 'package:flutter/material.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String email;

  const ProfileSectionWidget({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage('assets/images/profile_placeholder.png'),
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome back,",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                email,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}