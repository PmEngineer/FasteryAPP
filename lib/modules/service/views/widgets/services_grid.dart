import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/service_model.dart';
import '../../controllers/service_controller.dart';

class ExploreServicesSection extends GetView<ServiceController> {
  const ExploreServicesSection({super.key});

  Widget _buildServiceItem(ServiceModel service) {
    return GestureDetector(
      // onTap: () => controller.onServiceTap(service),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Image/Icon
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  service.iconUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.textGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 40,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ),
              // SALE Tag
              if (service.isSale)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Sale',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            service.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.kDarkText,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mainServices = controller.services.take(8).toList();

      if (controller.services.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: CircularProgressIndicator(color: AppColors.primaryRed),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Explore All Services Header ---
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20,),
            child: Text(
              'Explore all services',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kDarkText,
              ),
            ),
          ),

          // --- Services Grid ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Important!
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
              itemCount: mainServices.length,
              itemBuilder: (context, index) {
                return _buildServiceItem(mainServices[index]);
              },
            ),
          ),
        ],
      );
    });
  }
}

// =========================================================================
// 💡 MODIFIED: ServiceView
// =========================================================================
class ServiceView extends GetView<ServiceController> {
  const ServiceView({super.key});

  // Re-used Service Grid Item (Removed, now in ExploreServicesSection)
  // Re-used Banner Card
  Widget _buildBannerCard(String title, String subtitle) {
    // ... (Your existing _buildBannerCard implementation)
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFFFBE7E9),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1542848906-81a171d87f59'),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
            opacity: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kDarkText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.kDarkText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- New Widget: The custom search bar to be in the App Bar ---
  Widget _buildSearchBar(String hintText,) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textGrey.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.textGrey, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hintText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.textGrey,
                ),
              ),
            ),
            const Icon(Icons.shopping_cart_outlined, color: AppColors.kDarkText, size: 20),
          ],
        ),
      ),
    );
  }

  // --- New Widget: The large 'Winter Care Pack' banner content ---
  Widget _buildWinterCarePackBanner() {
    // Create a mock list for the 6 services in the banner
    final List<Map<String, dynamic>> winterServices = [
      {'title': 'Hotbed Relaxing Spa', 'image': 'https://plus.unsplash.com/premium_photo-1679430672295-3846f0cf0503?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNwYXxlbnwwfHwwfHx8MA%3D%3D'},
      {'title': 'Mattress deep-cleaning', 'image': 'https://plus.unsplash.com/premium_photo-1663013574100-40823db47fcc?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8TWF0dHJlc3MlMjBkZWVwLWNsZWFuaW5nfGVufDB8fDB8fHww'},
      {'title': 'Appliance repair', 'image': 'https://plus.unsplash.com/premium_photo-1663047695260-98cde4d6bbc7?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8QXBwbGlhbmNlJTIwcmVwYWlyfGVufDB8fDB8fHww'},
      {'title': 'Geyser de-scaling', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTydsjyf4utSg0ikpTs59t7G6-NCwOrmPz6_w&s'},
      {'title': 'Skin care & grooming', 'image': 'https://images.unsplash.com/photo-1577466802315-e80bbbb22a08?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNraW4lMjBjYXJlJTIwYW5kJTIwZ3Jvb21pbmd8ZW58MHx8MHx8fDA%3D'},
      {'title': 'Nourishing hair spa', 'image': 'https://plus.unsplash.com/premium_photo-1663036868412-7daaa14491bc?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG1lbnMlMjBzYWxvbnxlbnwwfHwwfHx8MA%3D%3D'},
    ];

    // Helper widget for the small circular icons in the banner
    Widget _buildSmallBannerItem(String title, String imageUrl) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 90,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryRed, // Dark purple background
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1541795795322-cf87570659a2'), // Background image hint
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            // Search Bar (Fixed at the top of the expanded app bar)
            _buildSearchBar('Search for \'Kitchen cleaning\'', ),
            const SizedBox(height: 16),

            // Winter Care Pack Title
            Text(
              'WINTER\nCARE PACK',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),

            // 6-Item Grid for Winter Services
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 services per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1, // Tighter ratio to match the image layout
              ),
              itemCount: winterServices.length,
              itemBuilder: (context, index) {
                final service = winterServices[index];
                return _buildSmallBannerItem(service['title'] as String, service['image'] as String);
              },
            ),
            const SizedBox(height: 16),

            // View All Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View all',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. SliverAppBar (The Collapsible Header)
          SliverAppBar(
            pinned: true, // Keeps the small header visible when scrolled
            expandedHeight: 460.0, // Height of the expanded banner
            backgroundColor: AppColors.lightGrey,
            elevation: 0,
            // The title bar content when collapsed
            title: AnimatedOpacity(
              opacity: 0.0, // Keep the title bar hidden/minimal when collapsed
              duration: const Duration(milliseconds: 300),
              child: _buildSearchBar('Search for \'Kitchen cleaning\'',),
            ),
            // The large content that collapses
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: _buildWinterCarePackBanner(),
            ),
            leading: const Text(""),
          ),

          // 2. SliverList (The Scrollable Body Content)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // 💡 INTEGRATED NEW CLASS HERE
                const ExploreServicesSection(),

                // --- Bottom Banner Card ---
                _buildBannerCard(
                  'Home painting & waterproofing',
                  'Pay after 100% satisfaction',
                ),

                // Add padding for the bottom navigation bar (simulated)
                const SizedBox(height: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}