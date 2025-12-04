import 'package:flutter/material.dart';
import 'package:solarx/widgets/deal_card.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Theme / color constants
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const Color primaryActual = Color(0xFF102216);
  static const Color accentGreen = Color(0xFF38A169);
  static const Color containerColor = Color(0xFF1A3824);
  static const Color secondaryText = Color(0xFFA0AEC0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryActual,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on_rounded, color: Colors.white),
        ),
        title: const Text("Mumbai, MH", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryActual,
        actions: [
          IconButton(
            onPressed: () => debugPrint("Notifications tapped"),
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(

          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Search bar ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: containerColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: accentGreen),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Panels, inverters...',
                            hintStyle: const TextStyle(color: Color(0xFFA0AEC0)),
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // --- Cards row (3 items) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItemCard('assets/images/Solar_panel.png', 'New Panel', 'Latest Models'),
                    const SizedBox(width: 8),
                    _buildItemCard('assets/images/Solar_panel.png', 'Used/Refurbished', 'Verified Quality'),
                    const SizedBox(width: 8),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // --- Horizontal filter chips (scrollable) ---
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip("Wattage", onTap: () {}),
                      _buildFilterChip("Brands", onTap: () {}),
                      _buildFilterChip("Price", onTap: () {}),
                      _buildFilterChip("Condition", onTap: () {}),
                      _buildFilterChip("Warranty", onTap: () {}),
                      const SizedBox(width: 12), // extra end padding
                    ],
                  ),

                ),
              ),

              const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Today's Energy Saver Deals ⚡",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/Solar_panel.png',
                        title: 'REC Alpha Pure-R',
                        subtitle: '430 W  |  22.3% Efficiency',
                        price: '\$280',
                        oldPrice: '\$350',
                      ),
                      SizedBox(width: 12),
                      ProductCard(
                        imagePath: 'assets/images/Solar_panel.png',
                        title: 'SolarMax 430W',
                        subtitle: '430 W  |  22.0% Efficiency',
                        price: '₹25,000',
                        oldPrice: '₹35,000',
                      ),
                    ],
                  ),

                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Refurbished with Verified Health ✅",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      RefurbishedCard(
                        imagePath: 'assets/images/Solar_panel.png',
                        title: 'LG NeON 2 (Used)',
                        specLine: '430 W | 22.3% Efficiency',
                        batteryHealth: '98% Battery Health',
                        price: '\$150',
                        priceLabel: 'Per Panel',
                        onTap: () {},
                      ),
                      const SizedBox(width: 12),
                      RefurbishedCard(
                        imagePath: 'assets/images/Solar_panel.png',
                        title: 'LG NeON 2 (Used)',
                        specLine: '430 W | 22.3% Efficiency',
                        batteryHealth: '98% Battery Health',
                        price: '\$150',
                        priceLabel: 'Per Panel',
                        onTap: () {},
                      ),
                    ],
                  ),

                ),

              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Combo Kits 📦",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ComboKitCard(
                  imagePath: 'assets/images/Solar_panel.png', // replace with your asset
                  title: 'Starter Kit Pro',
                  subtitle: 'Panels + Inverter + Battery',
                  ctaLabel: 'Shop Now',
                  onTap: () {
                    // navigate to combo details or shop page
                    debugPrint('Starter Kit Pro tapped');
                  },
                  // optional customization:
                  borderRadius: 16,
                  accentColor: const Color(0xFF2ECC71),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ComboKitCard(
                  imagePath: 'assets/images/Solar_panel.png', // replace with your asset
                  title: 'Max Energy Bundle',
                  subtitle: 'high-wattage panels & storage',
                  ctaLabel: 'Shop Now',
                  onTap: () {
                    // navigate to combo details or shop page
                    debugPrint('Starter Kit Pro tapped');
                  },
                  // optional customization:
                  borderRadius: 16,
                  accentColor: const Color(0xFF2ECC71),
                ),
              ),
            ],

          ),

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryActual,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: accentGreen,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],
      ),




    );

  }

  // Helper for item card: returns an Expanded widget that fits in a Row
  Widget _buildItemCard(String assetPath, String typeOfPanel, String moreInfo) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rounded image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.white12,
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, color: Colors.white70, size: 48),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),
            Text(typeOfPanel, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(moreInfo, style: const TextStyle(color: accentGreen)),
          ],
        ),
      ),
    );
  }

  // Filter chip builder (not using Expanded because this Row is inside a horizontal scroll)
  Widget _buildFilterChip(String label, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Text(label, style: const TextStyle(color: accentGreen)),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
