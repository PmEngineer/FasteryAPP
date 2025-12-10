import 'package:fastery/core/widgets/custom_app_bar.dart';
import 'package:fastery/modules/cart/views/widgets/no_item_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/cart_controller.dart';
import 'widgets/add_tems_banner.dart';
import 'widgets/bill_summary_overview.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/delivery_time.dart';
import 'widgets/full_bill_summary_card.dart';
import 'widgets/no_fees_card.dart';
import 'widgets/offer_card.dart';
import 'widgets/savings_banner.dart';
import 'widgets/special_offers.dart';
import 'widgets/wishlist_section.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            pinned: true,
            toolbarHeight: 10 + statusBarHeight,
            automaticallyImplyLeading: false,
            flexibleSpace: CustomAppBar(title: "Cart")
          ),

          Obx(() {
            if (cartController.cartItems.isEmpty) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  const Center(child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: NoItemFound()
                  )),
                ]),
              );
            }

            // 2. Create CartItemCard widgets dynamically from the cartItems list
            final cartItemWidgets = cartController.cartItems.map((item) {
              final product = item.product;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CartItemCard(
                  name: product.title,
                  quantity: '${item.quantity} x ${product.weight}',
                  price: product.price,
                  mrp: product.originalPrice,
                  imageUrl: product.imageUrl,
                  // Pass the product for quantity updates
                  cartItem: item,
                ),
              );
            }).toList();

            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  const NoFeesCard(),
                  const AddItemsBanner(),
                  const OfferCard(),
                  const SizedBox(height: 8),
                  const DeliveryTime(),
                  const SizedBox(height: 8),

                  // 3. Insert the dynamically generated cart items
                  ...cartItemWidgets,

                  const SizedBox(height: 8),
                  const WishlistSection(),
                  const SizedBox(height: 8),
                  const BillSummaryOverview(),
                  const SizedBox(height: 8),
                  const FullBillSummaryCard(),
                  const SizedBox(height: 8),
                  const SpecialOffers(),
                ],
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isEmpty) {
          // 2. Return null or an empty widget when the cart is empty
          return const SizedBox.shrink();
        }

        // 3. Return the full bottom bar if the cart is NOT empty
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              // Placeholder action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryRed,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
            ),
            child: Text(
              'Select Address',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }),
    );
  }
}



