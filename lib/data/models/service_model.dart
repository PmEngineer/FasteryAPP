class ServiceModel {
  final String title;
  final String iconUrl;
  final bool isSale;
  final String route; // Assuming a route for navigation

  ServiceModel({
    required this.title,
    required this.iconUrl,
    this.isSale = false,
    required this.route,
  });
}

// --- Mock Data for Demonstration (Use relevant URLs) ---
final List<ServiceModel> mockServices = [
  ServiceModel(
    title: 'Women\'s Salon & Spa',
    iconUrl: 'https://images.unsplash.com/photo-1522330752767-f579340e4952',
    route: '/womens-salon',
  ),
  ServiceModel(
    title: 'Men\'s Salon & Massage',
    iconUrl: 'https://images.unsplash.com/photo-1621601618177-3e11504104d5',
    route: '/mens-salon',
  ),
  ServiceModel(
    title: 'Cleaning',
    iconUrl: 'https://images.unsplash.com/photo-1579758782352-78d2b2723c3b',
    route: '/cleaning',
  ),
  ServiceModel(
    title: 'Electrician, Plumber & Carpenter',
    iconUrl: 'https://images.unsplash.com/photo-1518770660439-4630ee741753',
    route: '/repair',
  ),
  ServiceModel(
    title: 'AC & Appliance Repair',
    iconUrl: 'https://images.unsplash.com/photo-1623315663738-ee99f925c48b',
    route: '/ac-repair',
  ),
  ServiceModel(
    title: 'Native Water Purifier',
    iconUrl: 'https://images.unsplash.com/photo-1596766782245-c1511218080c',
    route: '/water-purifier',
    isSale: true,
  ),
  ServiceModel(
    title: 'Painting & Waterproofing',
    iconUrl: 'https://images.unsplash.com/photo-1550570889-ec12a4336154',
    route: '/painting',
  ),
  ServiceModel(
    title: 'Native Smart Locks',
    iconUrl: 'https://images.unsplash.com/photo-1522867083988-c8751f80f171',
    route: '/smart-locks',
    isSale: true,
  ),
  // Additional mock data to fill the grid
  ServiceModel(
    title: 'Hot Bath',
    iconUrl: 'https://images.unsplash.com/photo-1596200234200-a6157835154c',
    route: '/hot-bath',
  ),
  ServiceModel(
    title: 'Pest Control',
    iconUrl: 'https://images.unsplash.com/photo-1558231922-4914d799f984',
    route: '/pest-control',
  ),
];