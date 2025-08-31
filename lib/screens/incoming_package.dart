import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'qr_screen.dart';
import 'outgoing_package.dart';


// The IncomingPackage widget should be a StatelessWidget, not a MaterialApp.
// This allows it to inherit the theme from the parent MaterialApp at the root.
class IncomingPackage extends StatelessWidget {
  const IncomingPackage({super.key});

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold directly, so it uses the theme defined in main.dart.
    return const ShipmentsScreen();
  }
}

// Convert ShipmentsScreen to a StatefulWidget
class ShipmentsScreen extends StatefulWidget {
  const ShipmentsScreen({super.key});

  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  // Define a list of all shipment data
  final List<Map<String, dynamic>> allShipments = [
    {
      'orderNumber': '12345',
      'status': 'Scanned',
      'isScanned': true,
      'isCompleted': true,
    },
    {
      'orderNumber': '67890',
      'status': 'Pending',
      'isScanned': false,
      'isCompleted': false,
    },
    {
      'orderNumber': '54321',
      'status': 'Scanned',
      'isScanned': true,
      'isCompleted': true,
    },
    {
      'orderNumber': '09876',
      'status': 'Pending',
      'isScanned': false,
      'isCompleted': false,
    },
  ];

  // State variable to hold the current filter
  String currentFilter = 'All Orders';
  int _selectedIndex = 0;

  // A method to filter shipments based on the selected button
  List<Map<String, dynamic>> get filteredShipments {
    if (currentFilter == 'All Orders') {
      return allShipments;
    } else if (currentFilter == 'Scanned') {
      return allShipments.where((shipment) => shipment['isScanned'] == true).toList();
    } else if (currentFilter == 'Pending') {
      return allShipments.where((shipment) => shipment['isScanned'] == false).toList();
    }
    return allShipments;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const QRScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold background will now be explicitly set to white, overriding the global theme.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // The AppBar background and text style will now inherit from the global theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          // Redirect to DashboardScreen when the back button is pressed
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const IncomingPackage()),
                );
              },
              child: const Text(
                'Incoming Shipments',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OutgoingPackage()),
                );
              },
              child: const Text(
                'Outgoing Shipments',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Button for 'All Orders'
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentFilter = 'All Orders';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentFilter == 'All Orders' ? Colors.black : Colors.white,
                        foregroundColor: currentFilter == 'All Orders' ? Colors.white : Colors.black,
                        side: currentFilter == 'All Orders' ? null : const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('All Orders'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Button for 'Pending'
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentFilter = 'Pending';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentFilter == 'Pending' ? Colors.black : Colors.white,
                        foregroundColor: currentFilter == 'Pending' ? Colors.white : Colors.black,
                        side: currentFilter == 'Pending' ? null : const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Pending'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Button for 'Scanned'
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentFilter = 'Scanned';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentFilter == 'Scanned' ? Colors.black : Colors.white,
                        foregroundColor: currentFilter == 'Scanned' ? Colors.white : Colors.black,
                        side: currentFilter == 'Scanned' ? null : const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Scanned'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Use a ListView to dynamically build the OrderCard widgets
              ...filteredShipments.map((shipment) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: OrderCard(
                    orderNumber: shipment['orderNumber'],
                    status: shipment['status'],
                    isScanned: shipment['isScanned'],
                    isCompleted: shipment['isCompleted'],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
        ],
      ),
    );
  }
}

// The OrderCard widget remains a StatelessWidget
class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final bool isScanned;
  final bool isCompleted;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.status,
    this.isScanned = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFFB8F56C) : const Color(0xFFFF9B61),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order No. $orderNumber',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                'J&T Delivery Services',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Status: $status',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Contents    : Ergo Chair'),
          const Text('Quantity    : 12'),
          const Text('Supplier    : Herman Miller'),
          const SizedBox(height: 16),
          _buildTrackingTimeline(isCompleted, isScanned),
        ],
      ),
    );
  }

  Widget _buildTrackingTimeline(bool isCompleted, bool isScanned) {
    return Row(
      children: [
        _buildTimelineStep(
          icon: Icons.shopping_cart_outlined,
          label: 'Order Placed',
          date: '12 Aug 2025',
          isCompleted: true,
          isFirst: true,
        ),
        _buildTimelineStep(
          icon: Icons.local_shipping_outlined,
          label: 'Order Arrived',
          date: '12 Aug 2025',
          isCompleted: isCompleted,
          isScanned: isScanned,
        ),
        _buildTimelineStep(
          icon: Icons.qr_code_scanner,
          label: 'Item Scanned',
          date: '12 Aug 2025',
          isCompleted: isCompleted,
          isScanned: isScanned,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineStep({
    required IconData icon,
    required String label,
    required String date,
    required bool isCompleted,
    bool isScanned = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    Color activeColor = isCompleted ? Colors.black : Colors.grey;
    Color inactiveColor = Colors.grey.withOpacity(0.5);

    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              if (!isFirst)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted ? activeColor : inactiveColor,
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activeColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: activeColor,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted ? activeColor : inactiveColor,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: activeColor,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: activeColor,
            ),
          ),
        ],
      ),
    );
  }
}