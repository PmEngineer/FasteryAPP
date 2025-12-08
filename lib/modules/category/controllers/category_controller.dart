import 'package:get/get.dart';

import '../../../data/models/category_model.dart';

class CategoryController extends GetxController {
  // Use Obx or update() for state changes if data fetching was real.
  final categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // Mock data based on the provided image
    categories.assignAll([
      CategoryModel(title: 'Fresh Vegetables', iconUrl: 'https://placehold.co/100x100/A0E7E5/white?text=Veg'),
      CategoryModel(title: 'Fresh Fruits', iconUrl: 'https://placehold.co/100x100/FFC94A/white?text=Fruit'),
      CategoryModel(title: 'Dairy, Bread and Eggs', iconUrl: 'https://placehold.co/100x100/90E0EF/white?text=Dairy'),
      CategoryModel(title: 'Cereals and Breakfast', iconUrl: 'https://placehold.co/100x100/F08080/white?text=Cereal'),
      CategoryModel(title: 'Atta, Rice and Dal', iconUrl: 'https://placehold.co/100x100/CDB4DB/white?text=Atta'),
      CategoryModel(title: 'Oils and Ghee', iconUrl: 'https://placehold.co/100x100/FFD700/white?text=Oil'),
      CategoryModel(title: 'Masalas', iconUrl: 'https://placehold.co/100x100/8B0000/white?text=Spice'),
      CategoryModel(title: 'Dry Fruits and Seeds Mix', iconUrl: 'https://placehold.co/100x100/DDA0DD/white?text=Nuts'),
      CategoryModel(title: 'Biscuits and Cakes', iconUrl: 'https://placehold.co/100x100/B0E0E6/white?text=Cake'),
      CategoryModel(title: 'Tea, Coffee and Milk dri...', iconUrl: 'https://placehold.co/100x100/ADD8E6/white?text=Coffee'),
      CategoryModel(title: 'Sauces and Spreads', iconUrl: 'https://placehold.co/100x100/FFB6C1/white?text=Sauce'),
      CategoryModel(title: 'Meat and Seafood', iconUrl: 'https://placehold.co/100x100/CD5C5C/white?text=Meat'),
      // Additional sections for a more complete list
      CategoryModel(title: 'Snacks & Drinks', iconUrl: 'https://placehold.co/100x100/F0E68C/white?text=Snack'),
      CategoryModel(title: 'Baby Care', iconUrl: 'https://placehold.co/100x100/D8BFD8/white?text=Baby'),
    ]);

    super.onInit();
  }

  void onCategoryTap(CategoryModel category) {
    // Logic for navigating to the product list for the selected category
    Get.snackbar(
      'Category Selected',
      'Navigating to products for: ${category.title}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}