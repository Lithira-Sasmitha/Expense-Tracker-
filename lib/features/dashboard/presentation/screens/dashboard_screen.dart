import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back 👋', style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text(AppConstants.appName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$4,850.50',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSummaryItem('Income', '\$6,200.00', Icons.arrow_downward_rounded, AppColors.success),
                      _buildSummaryItem('Expenses', '\$1,349.50', Icons.arrow_upward_rounded, AppColors.expense),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Recent Expenses Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildExpenseTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Supermarket Grocery',
              category: 'Shopping',
              amount: '-\$84.50',
              date: 'Today',
            ),
            _buildExpenseTile(
              icon: Icons.coffee_outlined,
              title: 'Starbucks Coffee',
              category: 'Food & Dining',
              amount: '-\$6.75',
              date: 'Yesterday',
            ),
            _buildExpenseTile(
              icon: Icons.directions_car_outlined,
              title: 'Uber Ride',
              category: 'Transportation',
              amount: '-\$15.20',
              date: '24 Sep',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String amount, IconData icon, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white24,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            Text(amount, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildExpenseTile({
    required IconData icon,
    required String title,
    required String category,
    required String amount,
    required String date,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryLight.withValues(alpha: 0.15),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('$category • $date', style: const TextStyle(fontSize: 12)),
        trailing: Text(
          amount,
          style: const TextStyle(
            color: AppColors.expense,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
