import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display relevant metrics, charts, countdown, smart calcs

class FounderDashboardScreen extends ConsumerWidget {
  const FounderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for dashboard data (e.g., user role, metrics)
    // final user = ref.watch(currentUserProvider);
    // final metrics = ref.watch(dashboardMetricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Founder Dashboard'),
        // TODO: Add actions (e.g., Settings, Logout)
      ),
      // TODO: Implement BottomNavigationBar or Drawer for navigation if needed
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Founder!', // TODO: Personalize with user name
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // --- Key Metrics Section ---
            Text(
              'Key Metrics', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Replace with actual metric widgets (e.g., Card with MRR, Active Clients)
            const Card(
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Monthly Recurring Revenue (MRR)'),
                subtitle: Text('\$10,000'), // Placeholder
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.people),
                title: Text('Active Clients'),
                subtitle: Text('15'), // Placeholder
              ),
            ),
            const SizedBox(height: 24),

            // --- Charts Section ---
            Text(
              'Performance Charts', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Integrate FL Chart widgets here (e.g., MRR Trend, Outreach Funnel)
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Chart Placeholder (e.g., MRR Trend)')),
            ),
            const SizedBox(height: 24),

            // --- Countdown Timer Section ---
            Text(
              'Exit Readiness Countdown', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Implement countdown timer logic and UI
            const Card(
              child: ListTile(
                leading: Icon(Icons.timer),
                title: Text('Time to Target Exit Date'),
                subtitle: Text('1 year, 6 months, 12 days'), // Placeholder
              ),
            ),
            const SizedBox(height: 24),

            // --- Smart Calculations Section ---
            Text(
              'Smart Calculations', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Display results from smart calculations (e.g., Projected MRR, Churn Rate)
            const Card(
              child: ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Projected MRR (Next Month)'),
                subtitle: Text('\$11,500'), // Placeholder
              ),
            ),
          ],
        ),
      ),
    );
  }
}

