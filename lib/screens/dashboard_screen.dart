import 'package:flutter/material.dart';

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

  // Styles
  static const headerStyle = TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD8FF76),
  );

static const weeklyReportTitleStyle = TextStyle(
  fontSize: 26, // bigger than content
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
  static const double dashboardLogoHeight = 59;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Helper widget for bottom cards
  Widget bottomCard(
    String asset,
    String label,
    Color bgColor,
    Color textColor,
  ) {
    return buildCard(
      bgColor,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(asset, height: gridCardIconSize, width: gridCardIconSize),
          const SizedBox(width: gridCardSpacing),
          Text(
            label,
            style: bottomCardTextStyleBase.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/secondary_logo.png",
                    height: dashboardLogoHeight,
                    width: dashboardLogoHeight,
                  ),
                  const SizedBox(width: 2),
                  const Text('Dashboard', style: headerStyle),
                ],
              ),
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
                          Text(
                            'Weekly Report',
                            style: weeklyReportTitleStyle,
                          ),
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
                    ),
                    bottomCard(
                      'assets/images/outgoing_dash_icon.png',
                      'Outgoing',
                      outgoingColor,
                      const Color(0xFF9B0E82),
                    ),
                    bottomCard(
                      'assets/images/transactions_dash_icon.png',
                      'Transactions',
                      transactionsColor,
                      const Color(0xFF90760F),
                    ),
                    bottomCard(
                      'assets/images/inventory_dash_icon.png',
                      'Inventory',
                      inventoryColor,
                      const Color(0xFF045A81),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E2237),
        selectedItemColor: weeklyReportColor,
        unselectedItemColor: weeklyReportColor.withOpacity(0.45),
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_icon.png',
              height: 40,
              width: 40,
              color: _selectedIndex == 0
                  ? weeklyReportColor
                  : weeklyReportColor.withOpacity(0.45),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/logistics_icon.png',
              height: 45,
              width: 45,
              color: _selectedIndex == 1
                  ? weeklyReportColor
                  : weeklyReportColor.withOpacity(0.45),
            ),
            label: 'Logistics',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/qr_icon.png',
              height: 60,
              width: 60,
              color: _selectedIndex == 2
                  ? weeklyReportColor
                  : weeklyReportColor.withOpacity(0.45),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/inventory_icon.png',
              height: 37,
              width: 37,
              color: _selectedIndex == 3
                  ? weeklyReportColor
                  : weeklyReportColor.withOpacity(0.45),
            ),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile_icon.png',
              height: 40,
              width: 40,
              color: _selectedIndex == 4
                  ? weeklyReportColor
                  : weeklyReportColor.withOpacity(0.45),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
