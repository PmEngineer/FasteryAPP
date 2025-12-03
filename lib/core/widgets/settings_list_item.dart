import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final IconData? icon;

  const SettingsListItem({super.key, required this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Icon(icon ?? Icons.chevron_right),
      onTap: onTap,
    );
  }
}