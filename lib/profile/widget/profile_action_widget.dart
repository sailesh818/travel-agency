import 'package:flutter/material.dart';

class ProfileActionWidget extends StatelessWidget {
  final int likeCount;
  final VoidCallback onLikePressed;

  const ProfileActionWidget({
    super.key,
    required this.likeCount,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onLikePressed,
          child: Row(
            children: [
              const Icon(Icons.thumb_up),
              const SizedBox(width: 5),
              Text('$likeCount'),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text("Messages", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}