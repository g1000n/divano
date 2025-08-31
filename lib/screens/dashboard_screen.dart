import 'package:flutter/material.dart';
import 'inventory_screen.dart';
import 'profile_screen.dart';
import 'qr_screen.dart';
import 'incoming_package.dart';
import 'outgoing_package.dart';
import 'transactions_screen.dart';
import '../widgets/custom_navbar.dart'; // adjust path if needed
import '../widgets/screen_header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Card colors
  static const weeklyReportColor = Color(0xFFD8FF76);
  static const incomingColor = Color(0xFFC8A0FF);
  static const outgoingColor = Color(0xFFF197E1);
  static const transactionsColor = Color(0xFFFDDE66);
  static const inventoryColor = Color(0xFF95DBFA);

  static const weeklyReportTitleStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Color(0xFF4F6F00),
  );

  static const weeklyReportContentStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF4F6F00),
  );

  static const bottomCardTextStyleBase = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
  );

  // Constants
  static const double weeklyReportCardHeight = 150;
  static const double gridCardIconSize = 24;
  static const double gridCardSpacing = 8;

  Widget buildCard(Color color, Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  Widget bottomCard(
    String asset,
    String label,
    Color bgColor,
    Color textColor, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: buildCard(
        bgColor,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              asset,
              height: gridCardIconSize,
              width: gridCardIconSize,
            ),
            const SizedBox(width: gridCardSpacing),
            Text(
              label,
              style: bottomCardTextStyleBase.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  // New: handle navbar taps
  void _onNavTap(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        // Already on Dashboard
        break;
      case 1:
        // Uncomment if you have a LogisticsScreen
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LogisticsScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const QRScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const InventoryScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Header
              const ScreenHeader(title: "Dashboard"),

              const SizedBox(height: 20),

              // Weekly Report Card
              buildCard(
                weeklyReportColor,
                SizedBox(
                  height: weeklyReportCardHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFF4F6F00)),
                          SizedBox(width: 6),
                          Text('Weekly Report', style: weeklyReportTitleStyle),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total Deliveries Completed:',
                        style: weeklyReportContentStyle,
                      ),
                      Text(
                        'Pending Deliveries:',
                        style: weeklyReportContentStyle,
                      ),
                      Text(
                        'Returned/Failed Deliveries:',
                        style: weeklyReportContentStyle,
                      ),
                      Text(
                        'Inventory Updates:',
                        style: weeklyReportContentStyle,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Grid Cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 22,
                  padding: EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight + 16,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    bottomCard(
                      'assets/images/incoming_dash_icon.png',
                      'Incoming',
                      incomingColor,
                      const Color(0xFF593190),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const IncomingPackage(),
                          ),
                        );
                      },
                    ),
                    bottomCard(
                      'assets/images/outgoing_dash_icon.png',
                      'Outgoing',
                      outgoingColor,
                      const Color(0xFF9B0E82),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OutgoingPackage(),
                          ),
                        );
                      },
                    ),
                    bottomCard(
                      'assets/images/transactions_dash_icon.png',
                      'Transactions',
                      transactionsColor,
                      const Color(0xFF90760F),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TransactionsScreen(),
                          ),
                        );
                      },
                    ),
                    bottomCard(
                      'assets/images/inventory_dash_icon.png',
                      'Inventory',
                      inventoryColor,
                      const Color(0xFF045A81),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const InventoryScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Updated navbar
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
