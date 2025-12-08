import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dashboard/view/widgets/product_card.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Products',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductCard(
                title: 'Mad Angles',
                weight: '60 g',
                price: '18',
                originalPrice: '20',
                discount: '10% OFF',
                imageUrl: 'https://placehold.co/150x100/F53B57/FFFFFF?text=Similar',
                isBestseller: false,
                description: '',
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
