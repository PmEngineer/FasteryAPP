import 'package:get/get.dart';
import '../model/order_item_model.dart';
import '../model/order_model.dart';

class ProfileController extends GetxController {
  final name = 'Test User'.obs;
  final phone = '+91 - 6393-xxx-xxx'.obs;
  final email = 'testuser@xyz.com'.obs;

  // 0 => Food, 1 => Instamart
  final selectedPastOrdersTab = 0.obs;

  // reactive lists
  final RxList<OrderModel> foodOrders = <OrderModel>[].obs;
  final RxList<OrderModel> instamartOrders = <OrderModel>[].obs;

  // Loading state
  final isLoadingMore = false.obs;
  final hasMoreOrders = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleData();
  }

  void _loadSampleData() {
    foodOrders.assignAll([
      OrderModel(
        id: 'f1',
        title: "McDonald's",
        location: 'Alambagh',
        imageUrl: '',
        delivered: true,
        orderedAt: 'September 14, 11:18 PM',
        billTotal: '₹167',
        items: [
          OrderItemModel(name: 'McAloo Tikki Meal', qty: 1, price: '₹167'),
        ],
        foodRating: 0,
        deliveryRating: 0,
        status: OrderStatus.delivered,
      ),
      OrderModel(
        id: 'f2',
        title: "La Pino'z Pizza",
        location: 'Alambagh',
        imageUrl: '',
        delivered: true,
        orderedAt: 'November 19, 6:21 PM',
        billTotal: '₹119',
        items: [
          OrderItemModel(name: 'Pepsi Cola 500 Ml', qty: 1, price: '₹49'),
          OrderItemModel(
            name: 'Capsicum, Paneer & Red Paprika Pizza',
            qty: 1,
            price: '₹70',
          ),
        ],
        foodRating: 4,
        deliveryRating: 5,
        status: OrderStatus.delivered,
      ),
    ]);

    instamartOrders.assignAll([
      OrderModel(
        id: 'i1',
        title: 'Instamart Order',
        location: 'Alambagh',
        imageUrl: '',
        delivered: true,
        orderedAt: 'July 06, 2023',
        billTotal: '₹402',
        items: [
          OrderItemModel(name: 'Milk 1L', qty: 2, price: '₹100'),
          OrderItemModel(name: 'Eggs 12pcs', qty: 1, price: '₹120'),
          OrderItemModel(name: 'Bread 400g', qty: 1, price: '₹82'),
        ],
        foodRating: 5,
        deliveryRating: 5,
        status: OrderStatus.delivered,
      ),
    ]);
  }

  // Load more orders (simulate pagination)
  Future<void> loadMoreOrders() async {
    if (isLoadingMore.value || !hasMoreOrders.value) return;

    isLoadingMore.value = true;

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    if (selectedPastOrdersTab.value == 0) {
      _loadMoreFoodOrders();
    } else {
      _loadMoreInstamartOrders();
    }

    isLoadingMore.value = false;
  }

  void _loadMoreFoodOrders() {
    final currentCount = foodOrders.length;
    final newOrders = [
      OrderModel(
        id: 'f${currentCount + 1}',
        title: "Burger King",
        location: 'Gomti Nagar',
        imageUrl: '',
        delivered: true,
        orderedAt: 'October 25, 8:30 PM',
        billTotal: '₹299',
        items: [OrderItemModel(name: 'Whopper Meal', qty: 1, price: '₹299')],
        foodRating: 5,
        deliveryRating: 4,
        status: OrderStatus.delivered,
      ),
      OrderModel(
        id: 'f${currentCount + 2}',
        title: "Domino's Pizza",
        location: 'Hazratganj',
        imageUrl: '',
        delivered: true,
        orderedAt: 'October 15, 7:45 PM',
        billTotal: '₹449',
        items: [
          OrderItemModel(
            name: 'Margherita Pizza Medium',
            qty: 1,
            price: '₹349',
          ),
          OrderItemModel(name: 'Garlic Bread', qty: 1, price: '₹100'),
        ],
        foodRating: 4,
        deliveryRating: 5,
        status: OrderStatus.delivered,
      ),
      OrderModel(
        id: 'f${currentCount + 3}',
        title: "KFC",
        location: 'Alambagh',
        imageUrl: '',
        delivered: true,
        orderedAt: 'September 30, 9:15 PM',
        billTotal: '₹399',
        items: [
          OrderItemModel(name: 'Zinger Burger Combo', qty: 1, price: '₹399'),
        ],
        foodRating: 5,
        deliveryRating: 5,
        status: OrderStatus.delivered,
      ),
    ];

    foodOrders.addAll(newOrders);

    if (foodOrders.length >= 10) {
      hasMoreOrders.value = false;
    }
  }

  void _loadMoreInstamartOrders() {
    final currentCount = instamartOrders.length;
    final newOrders = [
      OrderModel(
        id: 'i${currentCount + 1}',
        title: 'Instamart Order',
        location: 'Gomti Nagar',
        imageUrl: '',
        delivered: true,
        orderedAt: 'June 22, 2023',
        billTotal: '₹567',
        items: [
          OrderItemModel(name: 'Rice 5Kg', qty: 1, price: '₹350'),
          OrderItemModel(name: 'Oil 1L', qty: 1, price: '₹217'),
        ],
        foodRating: 4,
        deliveryRating: 4,
        status: OrderStatus.delivered,
      ),
      OrderModel(
        id: 'i${currentCount + 2}',
        title: 'Instamart Order',
        location: 'Hazratganj',
        imageUrl: '',
        delivered: true,
        orderedAt: 'June 10, 2023',
        billTotal: '₹320',
        items: [
          OrderItemModel(name: 'Biscuits Pack', qty: 3, price: '₹150'),
          OrderItemModel(name: 'Tea 250g', qty: 1, price: '₹170'),
        ],
        foodRating: 5,
        deliveryRating: 5,
        status: OrderStatus.delivered,
      ),
    ];

    instamartOrders.addAll(newOrders);

    if (instamartOrders.length >= 8) {
      hasMoreOrders.value = false;
    }
  }

  void setPastOrdersTab(int index) {
    selectedPastOrdersTab.value = index;
    hasMoreOrders.value = true;
  }

  void reorder(OrderModel order) {
    Get.snackbar('Reorder', 'Reordering from ${order.title}');
  }

  void onMenuTap(String key) {
    switch (key) {
      case 'Swiggy HDFC Bank Credit Card':
        Get.snackbar('HDFC Card', 'Opening credit card details...');
        break;
      case 'My Vouchers':
        Get.snackbar('My Vouchers', 'Opening vouchers...');
        break;
      case 'Account Statements':
        Get.snackbar('Account Statements', 'Opening statements...');
        break;
      case 'Order Food on Train':
        Get.snackbar('Order Food on Train', 'Opening train food service...');
        break;
      case 'Corporate Rewards':
        Get.snackbar('Corporate Rewards', 'Opening corporate rewards...');
        break;
      case 'Student Rewards':
        Get.snackbar('Student Rewards', 'Opening student rewards...');
        break;
      case 'My Instamart Wishlist':
        Get.snackbar('Instamart Wishlist', 'Opening Instamart wishlist...');
        break;
      case 'Favourites':
        Get.snackbar('Favourites', 'Opening favourites...');
        break;
      case 'Partner Rewards':
        Get.snackbar('Partner Rewards', 'Opening partner rewards...');
        break;
      default:
        Get.snackbar('Coming Soon', 'Feature is under development');
    }
  }
}
