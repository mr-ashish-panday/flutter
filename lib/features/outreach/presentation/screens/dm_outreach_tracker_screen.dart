import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display outreach blocks, handle interactions, smart recalc, offline storage, notifications

class DMOutreachTrackerScreen extends ConsumerWidget {
  const DMOutreachTrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for outreach data

    return Scaffold(
      appBar: AppBar(
        title: const Text('DM Outreach Tracker'),
        // TODO: Add actions (e.g., Add Block, Filter)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Outreach Blocks',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Implement the block grid UI
            // This could be a GridView or ListView of Card widgets representing blocks
            Container(
              height: 300,
              color: Colors.grey[300],
              child: const Center(child: Text('Outreach Block Grid Placeholder')),
            ),
            const SizedBox(height: 24),

            // --- Smart Recalculation Info ---
            Text(
              'Smart Recalculation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // TODO: Display info about smart recalculation logic
            const Text(
              'Your daily targets will adjust automatically based on progress and goals. (Placeholder)',
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
      // TODO: Add FloatingActionButton for adding new blocks?
    );
  }
}

