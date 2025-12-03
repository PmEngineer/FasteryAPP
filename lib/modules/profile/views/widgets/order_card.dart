// lib/modules/profile/views/widgets/order_card.dart

import 'package:flutter/material.dart';
import '../../model/order_model.dart';
import 'star_rating.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onReorder;

  const OrderCard({super.key, required this.order, this.onReorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          _buildItemsList(),
          const SizedBox(height: 6),
          const Divider(height: 1),
          const SizedBox(height: 12),
          _buildRatings(),
          const SizedBox(height: 12),
          _buildReorderButton(context),
          const SizedBox(height: 10),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        // Image with safe errorBuilder and fixed size
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            order.imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (ctx, err, stack) => Container(
              width: 56,
              height: 56,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: const Icon(Icons.restaurant, color: Colors.grey, size: 28),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Title + location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                order.location,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        // Delivered / Pending indicator
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              order.delivered ? 'Delivered' : 'Pending',
              style: TextStyle(
                color: order.delivered ? Colors.green[700] : Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (order.delivered) const SizedBox(height: 6),
            if (order.delivered)
              const Icon(Icons.check_circle, color: Colors.green, size: 18),
          ],
        ),
      ],
    );
  }

  Widget _buildItemsList() {
    return Column(
      children: order.items.map((it) => _buildItemRow(it)).toList(),
    );
  }

  Widget _buildItemRow(orderItem) {
    // orderItem has fields: name, qty, price
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Qty box (fixed)
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '${orderItem.qty}x',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(width: 10),

          // SAFEST: Flexible ensures no overflow even with very long names
          Flexible(
            child: Text(
              orderItem.name,
              style: const TextStyle(fontSize: 15),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),

          const SizedBox(width: 10),

          // Price
          Text(orderItem.price, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildRatings() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Food Rating',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 6),
              StarRating(rating: order.foodRating.toDouble()),
            ],
          ),
        ),
        Container(width: 1, height: 46, color: const Color(0xFFF1F1F1)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery Rating',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 6),
              StarRating(rating: order.deliveryRating.toDouble()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReorderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onReorder,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFE7DE),
          foregroundColor: const Color(0xFFFB6F2A),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('REORDER', style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        Text(
          'Ordered: ${order.orderedAt}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Spacer(),
        Text(
          'Bill Total: ${order.billTotal}',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
