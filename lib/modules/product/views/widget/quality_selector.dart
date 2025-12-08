import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_quantity_chip.dart';

class QualitySelector extends StatefulWidget {
  const QualitySelector({super.key});

  @override
  State<QualitySelector> createState() => _QualitySelectorState();
}

class _QualitySelectorState extends State<QualitySelector> {
  final List<Map<String, String>> mockQuantities = [
    {'qty': '2 Pieces', 'weight': '136-140 g', 'price': '34', 'original': '40', 'discount': '15% OFF'},
    {'qty': '4 Pieces', 'weight': '166-180 g', 'price': '66', 'original': '80', 'discount': '17% OFF'},
    {'qty': '60 g', 'weight': '60 g', 'price': '18', 'original': '20', 'discount': '10% OFF'},
    {'qty': '40 g', 'weight': '40 g', 'price': '10', 'original': '12', 'discount': '10% OFF'},
  ];

  int _selectedQuantityIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quantity: ${mockQuantities[_selectedQuantityIndex]['qty']}',
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: mockQuantities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = mockQuantities[index];
            return ProductQuantityChip(
              weight: item['weight']!,
              price: item['price']!,
              discount: item['discount']!,
              isSelected: index == _selectedQuantityIndex,
              onTap: () => setState(() => _selectedQuantityIndex = index),
            );
          },
        ),
      ],
    );
  }
}
