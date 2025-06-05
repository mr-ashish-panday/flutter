import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart'; // Import FL Chart

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display relevant analytics data (KPIs, charts), implement PDF report generation

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for analytics data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              // TODO: Implement PDF report generation
              print('Generate PDF Report'); // Placeholder
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('PDF Report generation coming soon!')),
              );
            },
            tooltip: 'Generate PDF Report',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Performance Indicators (KPIs)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Replace with actual KPI widgets (e.g., GridView of Cards)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5, // Adjust aspect ratio as needed
              children: const [
                Card(child: ListTile(title: Text('Lead Conversion Rate'), subtitle: Text('15%'))), // Placeholder
                Card(child: ListTile(title: Text('Avg. Client Lifetime Value'), subtitle: Text('\$5,000'))), // Placeholder
                Card(child: ListTile(title: Text('Churn Rate'), subtitle: Text('5%'))), // Placeholder
                Card(child: ListTile(title: Text('Outreach Success Rate'), subtitle: Text('10%'))), // Placeholder
              ],
            ),
            const SizedBox(height: 24),

            // --- Charts Section ---
            Text(
              'Performance Trends',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Integrate FL Chart widgets here (e.g., Sales Trend, Client Growth)
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Chart Placeholder (e.g., Sales Trend)')),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Chart Placeholder (e.g., Client Growth)')),
            ),
            const SizedBox(height: 24),

            // --- Offline Status ---
            // TODO: Display offline status indicator if relevant for analytics
            // const Row(
            //   children: [
            //     Icon(Icons.cloud_off, size: 16),
            //     SizedBox(width: 8),
            //     Text('Offline mode active (Placeholder)'),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

