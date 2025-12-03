import 'package:flutter/material.dart';

class QuickOptionsRow extends StatelessWidget {
  const QuickOptionsRow({super.key});

  Widget _buildTile(IconData icon, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade50,
            ),
            child: Icon(icon, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTile(Icons.location_on_outlined, 'Saved\nAddress'),
        const SizedBox(width: 8),
        _buildTile(Icons.payment_outlined, 'Payment\nModes'),
        const SizedBox(width: 8),
        _buildTile(Icons.monetization_on_outlined, 'My\nRefunds'),
        ],
    );
  }
}