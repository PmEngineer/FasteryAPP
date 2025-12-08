import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        // Placeholder color matching the image
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          // Use a network image placeholder or asset
          image: NetworkImage('https://images.unsplash.com/photo-1534723452862-4c874018d66d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Z3JvY2VyeXxlbnwwfHwwfHx8MA%3D%3D'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Warm up with fresh\nwinter veggies',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Perfect for soups, parathas, and comfort meals.',
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'ORDER NOW',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}