import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display CRM pipeline, handle follow-ups, scoring, offline storage

class SalesCRMScreen extends ConsumerWidget {
  const SalesCRMScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for CRM data (leads, pipeline stages)

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales CRM'),
        // TODO: Add actions (e.g., Add Lead, Filter, Sort)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Pipeline', // TODO: Implement pipeline view (e.g., Kanban board or list by stage)
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Replace with actual pipeline visualization
            Container(
              height: 400, // Example height
              color: Colors.grey[300],
              child: const Center(child: Text('Sales Pipeline Placeholder (e.g., Kanban Board)')),
            ),
            const SizedBox(height: 24),

            // --- Follow-ups Section ---
            Text(
              'Upcoming Follow-ups', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Display list of upcoming follow-ups
            const ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Follow up with Prospect X'),
              subtitle: Text('Today, 2:00 PM'),
            ),
             const ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Send proposal to Lead Y'),
              subtitle: Text('Tomorrow'),
            ),
            const SizedBox(height: 24),

            // --- Lead Scoring Info ---
            // TODO: Display info about lead scoring if applicable

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
      // TODO: Add FloatingActionButton for adding new leads?
    );
  }
}

