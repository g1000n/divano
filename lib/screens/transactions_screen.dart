import 'package:flutter/material.dart';
import '../widgets/screen_header.dart';
import 'dashboard_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  bool isIncomingSelected = false;
  String selectedSort = 'Date';

  final List<String> sortOptions = ['Date', 'Amount', 'Name'];

  // Dummy transaction data
  final List<Map<String, String>> outgoingTransactions = List.generate(5, (
    index,
  ) {
    return {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sit amet.',
      'status': 'Completed',
    };
  });

  final Color bgColor = const Color(0xFF222531);
  final Color greenColor = const Color(0xFFCAEB78);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeader(title: "Transaction"),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton(
                    label: "Incoming",
                    isSelected: isIncomingSelected,
                    onTap: () {
                      setState(() {
                        isIncomingSelected = true;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  _buildToggleButton(
                    label: "Outgoing",
                    isSelected: !isIncomingSelected,
                    onTap: () {
                      setState(() {
                        isIncomingSelected = false;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // sort by drop down
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
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
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // transactions List
              Expanded(
                child: ListView.separated(
                  itemCount: outgoingTransactions.length,
                  separatorBuilder: (_, __) =>
                      Divider(color: Colors.white12, height: 1, thickness: 1),
                  itemBuilder: (context, index) {
                    final item = outgoingTransactions[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/box_transc_icon.png',
                            width: 30,
                            height: 30,
                            color: greenColor,
                          ),

                          const SizedBox(width: 16),

                          // title and description
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title']!,
                                  style: TextStyle(
                                    color: greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['subtitle']!,
                                  style: TextStyle(
                                    color: greenColor.withOpacity(0.6),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Status badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: greenColor),
                            ),
                            child: Text(
                              item['status']!,
                              style: TextStyle(
                                color: greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Back button at bottom
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    // goes back to dashboard
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Image.asset(
                    'assets/images/back_button.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 165,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? greenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: greenColor),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : greenColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
