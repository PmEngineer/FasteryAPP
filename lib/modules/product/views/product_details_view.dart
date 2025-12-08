// lib/modules/product/views/product_details_view.dart (UPDATED)

import 'package:fastery/modules/product/views/widget/flavour_selector.dart';
import 'package:fastery/modules/product/views/widget/product_header.dart';
import 'package:fastery/modules/product/views/widget/quality_selector.dart';
import 'package:fastery/modules/product/views/widget/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../dashboard/models/dashboard_section_model.dart';
import 'widget/product_details_app_bar.dart';
import 'widget/product_details_bottom_bar.dart';
import 'widget/product_payment_offers.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductItem product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  // NOTE: This mock data needs to align with the Product model fields
  final List<Map<String, String>> mockQuantities = [
    {'qty': '2 Pieces', 'weight': '136-140 g', 'price': '34', 'original': '40', 'discount': '15% OFF'},
    {'qty': '4 Pieces', 'weight': '166-180 g', 'price': '66', 'original': '80', 'discount': '17% OFF'},
    {'qty': '60 g', 'weight': '60 g', 'price': '18', 'original': '20', 'discount': '10% OFF'},
    {'qty': '40 g', 'weight': '40 g', 'price': '10', 'original': '12', 'discount': '10% OFF'},
  ];

  int _selectedQuantityIndex = 2;

  // Helper getter to combine product data with selected quantity details
  Map<String, String> get currentProductData => {
    'title': widget.product.title,
    'description': widget.product.description, // Assuming description exists in ProductItem
    'imageUrl': widget.product.imageUrl,      // Assuming imageUrl exists in ProductItem
    'isBestseller': widget.product.isBestseller.toString(), // Assuming isBestseller exists
    ...mockQuantities[_selectedQuantityIndex], // Overwrites/adds price, weight, discount
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // 1. Custom AppBar Widget
          ProductDetailsAppBar(product: widget.product),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 2. Product Info Body
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductHeader(ProductTitle: widget.product.title),
                      const Divider(height: 30),

                      // 3. Flavor Section
                      FlavourSelector(),
                      const Divider(height: 30),

                      // 4. Quantity Section (Uses new ProductQuantityChip)
                      QualitySelector(),
                      const SizedBox(height: 20),

                      // 5. Payment Offers Widget
                      const ProductPaymentOffers(),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View product details',
                          style: GoogleFonts.poppins(color: AppColors.primaryRed, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Divider(height: 30),
                      SimilarProducts(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // 7. Floating Add Button Widget
      // Pass the combined data required to construct the final Product model
      bottomNavigationBar: ProductDetailsBottomBar(
        productData: currentProductData,
      ),
    );
  }
}