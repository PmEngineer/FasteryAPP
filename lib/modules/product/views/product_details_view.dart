import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Assuming GetX usage from the previous context
import '../../../../core/constants/app_colors.dart';
import '../../dashboard/models/dashboard_section_model.dart';
import '../../dashboard/view/widgets/product_card.dart';

// Helper class for the Flavor pill style
class FlavorOption extends StatelessWidget {
  final String label;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const FlavorOption({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryRed : AppColors.textGrey.withOpacity(0.3),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 40),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primaryRed : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsView extends StatefulWidget {
  final ProductItem product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  // Mock data for different variants/flavors
  final List<Map<String, String>> mockFlavors = [
    {'label': 'Achaari', 'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYVbZLzJMCk5ITAvA-i5fjdyV3wnsoaU7kpA&s'},
    {'label': 'Achaari Mas...', 'url': 'https://www.glubery.com/public/uploads/1665731805Bingo_Mad_Angles_Achaari_Masti_66_g_2.jpg'},
    {'label': 'Masala', 'url': 'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/NI_CATALOG/IMAGES/CIW/2024/6/20/e32d7a34-4745-4974-94d8-58c9d179d5d2_chipsnachosandpopcorn_LQ5DFIHJY3_MN.png'},
  ];

  int _selectedFlavorIndex = 0;
  int _selectedQuantityIndex = 2; // Default to 60 g (index 2)

  // Mock data for different quantity/price combos
  final List<Map<String, String>> mockQuantities = [
    {'qty': '2 Pieces', 'weight': '136-140 g', 'price': '34', 'original': '40', 'discount': '15% OFF'},
    {'qty': '4 Pieces', 'weight': '166-180 g', 'price': '66', 'original': '80', 'discount': '17% OFF'},
    {'qty': '60 g', 'weight': '60 g', 'price': '18', 'original': '20', 'discount': '10% OFF'},
    {'qty': '40 g', 'weight': '40 g', 'price': '10', 'original': '12', 'discount': '10% OFF'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // --- Custom AppBar with Image and Back Button (Screenshot 1 & 2) ---
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: false,
            floating: false,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false, // Control leading button explicitly
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primaryRed, // Background color for the image area
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        widget.product.imageUrl,
                        fit: BoxFit.contain,
                        height: 400,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Get.back(), // Use GetX back navigation
                      ),
                    ),
                    const Positioned(
                      top: 40,
                      right: 10,
                      child: Row(
                        children: [
                          Icon(Icons.bookmark_border, color: Colors.white),
                          SizedBox(width: 10),
                          Icon(Icons.share, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                // --- Product Info Card (Screenshot 1 & 2) ---
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('8 MINS', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryRed)),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.orange, size: 16),
                          Text('4.5', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
                          Text('(62.5k)', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.product.title,
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Tangy achaari-flavored crunchy chips',
                        style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey),
                      ),
                      const Divider(height: 30),
                      // --- Flavor Section (Screenshot 2) ---
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
                      const Divider(height: 30),

                      // --- Quantity Section (Screenshot 2 & 3) ---
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
                          return _buildQuantityChip(
                            index: index,
                            weight: item['weight']!,
                            price: item['price']!,
                            discount: item['discount']!,
                            isSelected: index == _selectedQuantityIndex,
                            onTap: (i) => setState(() => _selectedQuantityIndex = i),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // --- Payment Offers (Screenshot 3) ---
                      _buildPaymentOffers(),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View product details',
                          style: GoogleFonts.poppins(color: AppColors.primaryRed, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Divider(height: 30),

                      // --- Similar Products (Screenshot 3) ---
                      Text(
                        'Similar Products',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4, // Mock 4 similar products
                          itemBuilder: (context, index) {
                            // Re-using ProductCard with mock data for similar items
                            return ProductCard(
                              title: 'Mad Angles',
                              weight: '60 g',
                              price: '18',
                              originalPrice: '20',
                              discount: '10% OFF',
                              imageUrl: 'https://placehold.co/150x100/F53B57/FFFFFF?text=Similar',
                              isBestseller: false,
                              description: '', onTap: () {  },
                              // You would pass the item here instead of hardcoding
                              // onTap: () {}, // No need to navigate again here
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // --- Floating Add Button (Screenshot 3) ---
      bottomNavigationBar: _buildFloatingBottomBar(),
    );
  }

  Widget _buildQuantityChip({
    required int index,
    required String weight,
    required String price,
    required String discount,
    required bool isSelected,
    required Function(int) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed.withOpacity(0.1) : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryRed : AppColors.textGrey.withOpacity(0.3),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weight, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGrey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹$price', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                Text(discount, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.primaryRed, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOffers() {
    return Row(
      children: [
        const Icon(Icons.percent_rounded, color: AppColors.primaryRed, size: 24),
        const SizedBox(width: 8),
        Text(
          '₹150 OFF',
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryRed),
        ),
        const SizedBox(width: 8),
        Text(
          'Payment Offers',
          style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark),
        ),
      ],
    );
  }

  Widget _buildFloatingBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '₹${mockQuantities[_selectedQuantityIndex]['price']}',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '₹${mockQuantities[_selectedQuantityIndex]['original']}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textGrey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Text(
                  mockQuantities[_selectedQuantityIndex]['discount']!,
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primaryRed, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              'ADD',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}