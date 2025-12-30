import 'package:fastery/modules/profile/views/pages/order_histroy_view.dart';
import 'package:fastery/modules/profile/views/widgets/past_orders_sections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFFF5722),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text(
              'Help',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Profile Header
          Container(
            color: const Color(0xFFF5F5F5),
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
            child: Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.name.value,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3142),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    controller.phone.value,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.email.value,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quick Options Grid
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickOption(Icons.location_on_outlined, 'Saved\nAddress'),
                _buildQuickOption(Icons.credit_card_outlined, 'Payment\nModes'),
                _buildQuickOption(Icons.currency_rupee, 'My\nRefunds'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Menu Items Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                _buildMenuItem(
                    Icons.confirmation_number_outlined,
                    'My Vouchers',
                        (){}
                ),
                const Divider(height: 1),
                _buildMenuItem(
                    Icons.history_sharp,
                    'Order History',
                        (){
                      Get.to(
                            () => OrdersHistoryView(),
                        // ✅ Apply the right-to-left transition here:
                        transition: Transition.rightToLeft,
                        // Optional: Set a smooth duration
                        duration: const Duration(milliseconds: 300),
                      );
                    }
                ),
                const Divider(height: 1),
                _buildMenuItem(
                    Icons.description_outlined,
                    'Account Statements',
                        (){}
                ),
                const Divider(height: 1),
                _buildMenuItem(
                    Icons.business_center_outlined,
                    'Corporate Rewards',
                        (){}
                ),
                const Divider(height: 1),
                _buildMenuItem(Icons.school_outlined, 'Student Rewards', (){}),
                const Divider(height: 1),
                _buildMenuItem(Icons.bookmark_border, 'My Shopy Wishlist', (){}),
                const Divider(height: 1),
                _buildMenuItem(Icons.favorite_border, 'Favourites', (){}),
                const Divider(height: 1),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Past Orders Section
          const PastOrdersSection(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildQuickOption(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Icon(icon, size: 28, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback? onTap) {
    return InkWell(
      // FIX: Change to directly pass the function or execute it.
      onTap: onTap,
      // OR, if you prefer the arrow function style: onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey.shade700),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}