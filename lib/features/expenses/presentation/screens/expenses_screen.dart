import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search expenses...',
              prefixIcon: const Icon(Icons.search_rounded),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text(
                'No additional expenses added yet.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
