
class DashboardSection {
  final String title;
  final List<ProductItem> products;

  DashboardSection(this.title, this.products);
}

class ProductItem {
  final String title;
  final String description;
  final String weight;
  final String price;
  final String originalPrice;
  final String discount;
  final String imageUrl;
  final bool isBestseller;
  final bool isCategory; // For the grid items

  ProductItem({
    required this.title,
    this.description = '',
    this.weight = '',
    required this.price,
    this.originalPrice = '',
    this.discount = '',
    this.imageUrl = 'https://placehold.co/150x100/eeeeee/333333?text=Product',
    this.isBestseller = false,
    this.isCategory = false,
  });
}

// --- Mock Data ---

final List<ProductItem> mockHotDeals = [
  ProductItem(
    title: 'Bingo Mad Angles Achaari Masala Crisps',
    price: '18',
    originalPrice: '20',
    discount: '10% OFF',
    weight: '60 g',
    imageUrl: 'https://www.bbassets.com/media/uploads/p/l/238341_24-bingo-mad-angles-achaari-masti.jpg',
    isBestseller: true,
  ),
  ProductItem(
    title: 'Cadbury Oreo Vanilla Flavour Fingers',
    price: '8',
    originalPrice: '10',
    discount: '20% OFF',
    weight: '40 g',
    imageUrl: 'https://www.quickpantry.in/cdn/shop/products/cadbury-oreo-creme-biscuits-chocolate-46-3-g-quick-pantry.jpg?v=1710538259&width=500',
    isBestseller: true,
  ),
  ProductItem(
    title: 'Nestle Kitkat Chocolate Coated Wafers',
    price: '22',
    originalPrice: '25',
    discount: '12% OFF',
    weight: '24 g',
    imageUrl: 'https://placehold.co/150x100/FF0000/FFFFFF?text=KitKat',
  ),
  ProductItem(
    title: 'Lays Potato Chips',
    price: '15',
    originalPrice: '15',
    discount: '',
    weight: '50 g',
    imageUrl: 'https://placehold.co/150x100/FFA500/FFFFFF?text=Lays',
  ),
];

final List<ProductItem> mockGroceryCategories = [
  ProductItem(title: 'Fresh Vegetables', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/7CFC00/000000?text=Veg'),
  ProductItem(title: 'Fresh Fruits', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/FFD700/000000?text=Fruit'),
  ProductItem(title: 'Dairy and Bread', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/ADD8E6/000000?text=Dairy'),
  ProductItem(title: 'Cereals and Eggs', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/DEB887/000000?text=Cereals'),
  ProductItem(title: 'Atta, Rice and Dal', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/F0E68C/000000?text=Grain'),
  ProductItem(title: 'Oils and Ghee', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/BDB76B/000000?text=Oil'),
  ProductItem(title: 'Masalas', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/DDA0DD/000000?text=Spice'),
  ProductItem(title: 'Dry Fruits and Seeds Mix', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/CD853F/000000?text=Nuts'),
];

final List<DashboardSection> mockSections = [
  DashboardSection('Hot Deals', mockHotDeals),
  DashboardSection('Grocery & Kitchen', mockGroceryCategories),
  DashboardSection('Snacks & Drinks', mockGroceryCategories.reversed.toList()), // Reusing for layout
  DashboardSection('Beauty & Wellness', mockGroceryCategories), // Reusing for layout
];