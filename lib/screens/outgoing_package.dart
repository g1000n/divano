import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'qr_screen.dart';
import 'incoming_package.dart';

class OutgoingPackage extends StatefulWidget {
  const OutgoingPackage({super.key});

  @override
  State<OutgoingPackage> createState() => _OutgoingPackageState();
}

class _OutgoingPackageState extends State<OutgoingPackage> {
  // Define a list of all shipment data for outgoing packages
  final List<Map<String, dynamic>> allShipments = [
    {
      'orderNumber': '54321',
      'status': 'Delivered',
      'isDelivered': true,
      'isInTransit': true,
      'recipient': 'Juan Dela Cruz',
    },
    {
      'orderNumber': '54321',
      'status': 'In Transit',
      'isDelivered': false,
      'isInTransit': true,
      'recipient': 'Gion Lobo',
    },
    {
      'orderNumber': '09876',
      'status': 'In Transit',
      'isDelivered': false,
      'isInTransit': true,
      'recipient': 'Gion Lobo',
    },
  ];

  String currentFilter = 'All Orders';
  int _selectedIndex = 1;

  List<Map<String, dynamic>> get filteredShipments {
    if (currentFilter == 'All Orders') {
      return allShipments;
    } else if (currentFilter == 'Delivered') {
      return allShipments.where((shipment) => shipment['isDelivered'] == true).toList();
    } else if (currentFilter == 'In Transit') {
      return allShipments.where((shipment) => shipment['isInTransit'] == true && shipment['isDelivered'] == false).toList();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Updated to redirect to DashboardScreen
            Navigator.of(context).pushReplacement(
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
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Outgoing Shipments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentFilter = 'Delivered';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentFilter == 'Delivered' ? Colors.black : Colors.white,
                        foregroundColor: currentFilter == 'Delivered' ? Colors.white : Colors.black,
                        side: currentFilter == 'Delivered' ? null : const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Delivered'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentFilter = 'In Transit';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentFilter == 'In Transit' ? Colors.black : Colors.white,
                        foregroundColor: currentFilter == 'In Transit' ? Colors.white : Colors.black,
                        side: currentFilter == 'In Transit' ? null : const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('In Transit'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ...filteredShipments.map((shipment) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: OutgoingOrderCard(
                    orderNumber: shipment['orderNumber'],
                    status: shipment['status'],
                    isDelivered: shipment['isDelivered'],
                    isInTransit: shipment['isInTransit'],
                    recipient: shipment['recipient'],
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

class OutgoingOrderCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final bool isDelivered;
  final bool isInTransit;
  final String recipient;

  const OutgoingOrderCard({
    super.key,
    required this.orderNumber,
    required this.status,
    this.isDelivered = false,
    this.isInTransit = false,
    required this.recipient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDelivered ? const Color(0xFFB8F56C) : const Color(0xFFFF9B61),
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
                'LBC',
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
                  color: isDelivered ? Colors.green : Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Contents    : Ergo Chair'),
          const Text('Quantity    : 12'),
          Text('Recipient   : $recipient'),
          const SizedBox(height: 16),
          _buildTrackingTimeline(isDelivered, isInTransit),
        ],
      ),
    );
  }

  Widget _buildTrackingTimeline(bool isDelivered, bool isInTransit) {
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
          label: 'In Transit',
          date: '12 Aug 2025',
          isCompleted: isInTransit,
          isScanned: isInTransit,
        ),
        _buildTimelineStep(
          icon: Icons.check_circle_outline,
          label: 'Order Delivered',
          date: '12 Aug 2025',
          isCompleted: isDelivered,
          isScanned: isDelivered,
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
