import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import 'widgets/category_sidebar.dart';
import 'widgets/floating_delivery_info.dart';
import 'widgets/header_banner.dart';
import 'widgets/product_filter_bar.dart';
import 'widgets/product_item_card.dart';

class CategoryItemView extends StatelessWidget {
  final String title;
  const CategoryItemView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () {},
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: AppColors.textDark),
          ),
        ],
      ),
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Sidebar Category Menu
              const CategorySidebar(),

              // 2. Main Content Area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Banner
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: HeaderBanner(),
                      ),

                      // Filter Bar
                      const ProductFilterBar(),
                      const SizedBox(height: 10),

                      // Product Grid/List
                      _buildProductGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 3. Floating Bottom Info
          const Align(
            alignment: Alignment.bottomCenter,
            child: FloatingDeliveryInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    // Mock Data for the two visible products
    final List<Map<String, dynamic>> mockProducts = [
      {
        'title': 'Coriander Leaves without root',
        'description': 'Fresh, aromatic, detox, garnish for soups & curries',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZqj-XReJ2R76nji51cZl4ETk6-eHRmZBRw&s',
        'time': '8 MINS',
        'discount': '20% OFF',
        'price': '19',
        'originalPrice': '24',
        'quantity': '1 Bunch',
      },
      {
        'title': 'Spinach (Palak)',
        'description': 'Iron-rich, tender, perfect for curries & soups',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZqj-XReJ2R76nji51cZl4ETk6-eHRmZBRw&s',
        'time': '8 MINS',
        'discount': '26% OFF',
        'price': '41',
        'originalPrice': '56',
        'quantity': '1 Bunch x 2',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mockProducts.length, // Only showing 2 from the image
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45, // Adjust aspect ratio to fit content
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = mockProducts[index];
          return ProductItemCard(
            title: product['title'],
            description: product['description'],
            imageUrl: product['imageUrl'],
            time: product['time'],
            discount: product['discount'],
            price: product['price'],
            originalPrice: product['originalPrice'],
            quantity: product['quantity'],
          );
        },
      ),
    );
  }
}