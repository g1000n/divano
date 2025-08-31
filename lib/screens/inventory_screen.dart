import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';
import 'qr_screen.dart';
import 'profile_screen.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  int _selectedIndex = 3; // Default to Inventory tab

  // Dropdown options for sorting
  final List<String> sortOptions = ['Name', 'Supplier', 'Quantity'];
  String selectedSort = 'Name';

  // Handle navigation bar taps
  void _onNavTap(int index) {
    if (index == _selectedIndex) return;
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
        break;
      case 1:
        // LogisticsScreen() - implement if needed
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const QRScreen()),
        );
        break;
      case 3:
        break; // Already on Inventory
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  // Sample inventory data
  final List<_InventoryItem> items = [
    _InventoryItem(
      name: 'Headphone Stand',
      supplier: 'Ashley',
      quantity: 201,
      imagePath: 'assets/images/Headphone_Stand.png',
    ),
    _InventoryItem(
      name: 'Wacky Chair',
      supplier: 'Seane',
      quantity: 301,
      imagePath: 'assets/images/Wacky_Chair.png',
    ),
    _InventoryItem(
      name: 'Caroline Desk',
      supplier: 'Anouschka',
      quantity: 401,
      imagePath: 'assets/images/Caroline_Desk.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF1E2237);
    const Color greenColor = Color(0xFFCAEB78);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen header
              const ScreenHeader(title: "Inventory"),
              const SizedBox(height: 20),

              // Sorting row
              Row(
                children: [
                  Text(
                    "Sort by: ",
                    style: TextStyle(
                      color: greenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSort,
                        dropdownColor: bgColor,
                        iconEnabledColor: greenColor,
                        style: TextStyle(color: greenColor, fontSize: 13),
                        items: sortOptions.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              selectedSort = val;
                              // Sorting logic can be added here
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // List of inventory cards
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _InventoryCard(item: item, textColor: greenColor);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// Model for each inventory item
class _InventoryItem {
  final String name;
  final String supplier;
  final int quantity;
  final String imagePath;

  _InventoryItem({
    required this.name,
    required this.supplier,
    required this.quantity,
    required this.imagePath,
  });
}

// Card widget for displaying each inventory item
class _InventoryCard extends StatelessWidget {
  final _InventoryItem item;
  final Color textColor;

  const _InventoryCard({Key? key, required this.item, required this.textColor})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cardBgColor = Color(0xFF3E4355);
    const borderRadius = 15.0;

    return Container(
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.all(16),
      height: 150, // Card height
      child: Row(
        children: [
          // Item image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.imagePath,
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),

          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Item name
                Text(
                  item.name,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),

                // Supplier and quantity aligned
                Row(
                  children: [
                    SizedBox(
                      width: 150, // Keeps supplier text aligned
                      child: Text(
                        "Supplier: ${item.supplier}",
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Quantity: ${item.quantity}",
                      style: TextStyle(
                        color: textColor.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
