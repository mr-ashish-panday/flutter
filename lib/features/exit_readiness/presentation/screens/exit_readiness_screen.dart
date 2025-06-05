import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart'; // Import FL Chart

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display exit readiness milestones, calculate/display weighted score (incl. consistency), handle reporting, offline storage

class ExitReadinessScreen extends ConsumerWidget {
  const ExitReadinessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for exit readiness data (milestones, score, consistency)
    // final exitData = ref.watch(exitReadinessProvider);
    // final consistencyScore = ref.watch(consistencyMetricProvider); // Example

    // Placeholder score calculation
    double overallScore = 0.75; // 75%
    double consistencyScore = 0.8; // 80%

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exit Readiness'),
        // TODO: Add actions (e.g., View Report)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overall Exit Readiness Score',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // --- Score Visualization (FL Chart) ---
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 60,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: overallScore * 100,
                      title: '${(overallScore * 100).toStringAsFixed(0)}%',
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.grey.shade300,
                      value: (1 - overallScore) * 100,
                      title: '',
                      radius: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Consistency: ${(consistencyScore * 100).toStringAsFixed(0)}%', // Display consistency metric
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 24),

            // --- Milestones Section ---
            Text(
              'Key Milestones',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Replace with actual milestone list (e.g., ListView.builder with CheckboxListTile)
            CheckboxListTile(
              title: const Text('Standard Operating Procedures (SOPs) Documented'),
              value: true, // Placeholder
              onChanged: (bool? value) { /* TODO: Handle milestone update */ },
              secondary: const Text('90%'), // Placeholder weight/completion
            ),
            CheckboxListTile(
              title: const Text('Financial Audits Completed (Last 2 Years)'),
              value: true, // Placeholder
              onChanged: (bool? value) { /* TODO: Handle milestone update */ },
              secondary: const Text('100%'), // Placeholder weight/completion
            ),
            CheckboxListTile(
              title: const Text('Client Contracts Standardized'),
              value: false, // Placeholder
              onChanged: (bool? value) { /* TODO: Handle milestone update */ },
              secondary: const Text('50%'), // Placeholder weight/completion
            ),
            const SizedBox(height: 24),

            // --- Reporting Section ---
            // TODO: Add button to generate/view detailed report
            Center(
              child: ElevatedButton(onPressed: () {}, child: const Text('View Detailed Report')),
            ),
            const SizedBox(height: 24),

            // --- Offline Status ---
            // TODO: Display offline status indicator
            const Row(
              children: [
                Icon(Icons.cloud_off, size: 16),
                SizedBox(width: 8),
                Text('Offline mode active (Placeholder)'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

