import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,),
        Image.asset('assets/images/no_item.png', height: 150,),
        SizedBox(height: 20,),
        Text("Your Cart Is Empty", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),)
      ],
    );
  }
}
