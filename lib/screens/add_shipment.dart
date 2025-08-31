import 'package:flutter/material.dart';

class AddShipmentScreen extends StatefulWidget {
  const AddShipmentScreen({super.key});

  @override
  State<AddShipmentScreen> createState() => _AddShipmentScreenState();
}

class _AddShipmentScreenState extends State<AddShipmentScreen> {
  final List<Map<String, String>> _items = [];

  void _addItem() {
    setState(() {
      _items.add({'name': '', 'quantity': ''});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Add Shipment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
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
              const Text('Recipient Name :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextField('Recipient Name'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Order Date :', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        _buildTextField('DD/MMM/YYYY'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Quantity :', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        _buildTextField('Quantity'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Courier :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextField('Courier'),
              const SizedBox(height: 16),
              const Text('Tracking Link :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextField('Tracking Link'),
              const SizedBox(height: 16),
              const Text('Recipient Address :', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildLargeTextField('Recipient Address'),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Icon(Icons.list, size: 24),
                  SizedBox(width: 8),
                  Text('Item List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 16),
              ..._items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    children: [
                      _buildTextField('Item Name'),
                      const SizedBox(height: 16),
                      _buildTextField('Quantity'),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addItem,
        label: const Text('Add Item'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildLargeTextField(String hintText) {
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
