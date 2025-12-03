import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String phone;
  final String email;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.maybePop(context),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(phone, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54)),
                const SizedBox(height: 4),
                Text(email, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black38)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Help'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: 6),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }
}