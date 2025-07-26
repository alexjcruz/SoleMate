import 'package:flutter/material.dart';
import '../colors.dart';

class SneakerDetails extends StatefulWidget {
  final Map<String, dynamic> sneaker;

  const SneakerDetails({super.key, required this.sneaker});

  @override
  State<SneakerDetails> createState() => _SneakerDetails();
}

class _SneakerDetails extends State<SneakerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // AppBar with Sneaker Name
      appBar: AppBar(
        title: Text(
          'Sneaker Details',
          style: TextStyle(color: AppColors.primary, fontSize: 24),
        ),
        backgroundColor: AppColors.background,
        shape: Border(bottom: BorderSide(color: AppColors.primary)),
      ),
      
      // Body with Sneaker Details
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.sneaker['image']),
            SizedBox(height: 16),
            Text(
              widget.sneaker['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 8),
            Text('SKU: ${widget.sneaker['sku']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
            SizedBox(height: 8),
            Text('Brand: ${widget.sneaker['brand']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
            SizedBox(height: 8),
            Text('Color: ${widget.sneaker['color']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
            SizedBox(height: 8),
            Text('Price: \$${widget.sneaker['price']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
            SizedBox(height: 8),
            Text('Current Value: \$${widget.sneaker['current_value']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
            SizedBox(height: 8),
            Text('Size: ${widget.sneaker['size']}', style: TextStyle(fontSize: 18, color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}