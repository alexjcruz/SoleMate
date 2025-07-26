import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';
import 'dart:convert';

// Function to load a single sneaker by SKU 
Future<Map<String, dynamic>?> loadSneakerBySKU(String sku) async {
  try {
    final String response = await rootBundle.loadString('assets/sneakers.json');
    final List<dynamic> data = jsonDecode(response);
    final sneaker = data.firstWhere(
      (item) => item['sku'] == sku,
      orElse: () => null,
    );
    return sneaker != null ? Map<String, dynamic>.from(sneaker) : null;
  } catch (e) {
    print('Error loading sneaker: $e');
    return null;
  }
}

// Function to show a dialog for manually adding sneakers
void showManualAddDialog(BuildContext context, List<Map<String, dynamic>> sneakers, VoidCallback onUpdate) {
  final TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? errorMessage;

    showDialog(
      context: context, 
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.primary, width: 1),
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter SKU',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primary, width: 1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a SKU';
                    }
                    return null;
                  },
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 13),

                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final sku = controller.text.trim();
                  final sneaker = await loadSneakerBySKU(sku);
                  if (sneaker != null) {
                    sneakers.add(sneaker);
                    onUpdate(); 
                    Navigator.pop(dialogContext);
                  } else {
                    setState(() {
                      errorMessage = 'Failed to add sneaker. Please try again.';
                      
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.textbox,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: AppColors.primary, width: 1),
                ),
              ),
              child: Text('Add Sneaker',
                style:TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        )
      )
    );
}