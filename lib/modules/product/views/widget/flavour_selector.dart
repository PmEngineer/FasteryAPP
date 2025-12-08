import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'flavour_options.dart';

class FlavourSelector extends StatefulWidget {
  const FlavourSelector({super.key});

  @override
  State<FlavourSelector> createState() => _FlavourSelectorState();
}

class _FlavourSelectorState extends State<FlavourSelector> {
  final List<Map<String, String>> mockFlavors = [
    {'label': 'Achaari', 'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYVbZLzJMCk5ITAvA-i5fjdyV3wnsoaU7kpA&s'},
    {'label': 'Achaari Mas...', 'url': 'https://www.glubery.com/public/uploads/1665731805Bingo_Mad_Angles_Achaari_Masti_66_g_2.jpg'},
    {'label': 'Masala', 'url': 'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/NI_CATALOG/IMAGES/CIW/2024/6/20/e32d7a34-4745-4974-94d8-58c9d179d5d2_chipsnachosandpopcorn_LQ5DFIHJY3_MN.png'},
  ];

  int _selectedFlavorIndex = 0;

  final List<Map<String, String>> mockQuantities = [
    {'qty': '2 Pieces', 'weight': '136-140 g', 'price': '34', 'original': '40', 'discount': '15% OFF'},
    {'qty': '4 Pieces', 'weight': '166-180 g', 'price': '66', 'original': '80', 'discount': '17% OFF'},
    {'qty': '60 g', 'weight': '60 g', 'price': '18', 'original': '20', 'discount': '10% OFF'},
    {'qty': '40 g', 'weight': '40 g', 'price': '10', 'original': '12', 'discount': '10% OFF'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flavour: ${mockFlavors[_selectedFlavorIndex]['label']}',
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockFlavors.length,
            itemBuilder: (context, index) {
              return FlavorOption(
                label: mockFlavors[index]['label']!,
                imageUrl: mockFlavors[index]['url']!,
                isSelected: index == _selectedFlavorIndex,
                onTap: () => setState(() => _selectedFlavorIndex = index),
              );
            },
          ),
        ),
      ],
    );
  }
}
