import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display client list, handle lifecycle, details, deliverables, MRR, invoicing, offline storage

class ClientManagementScreen extends ConsumerWidget {
  const ClientManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for client data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Management'),
        // TODO: Add actions (e.g., Add Client, Filter, Sort)
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Active Clients', // TODO: Fetch and display client list
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // TODO: Replace with actual client list widgets (e.g., ListView.builder with Card/ListTile)
          const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('AC')), // Placeholder
              title: Text('Acme Corporation'),
              subtitle: Text('MRR: \$2,500 | Status: Active'),
              trailing: Icon(Icons.chevron_right),
              // TODO: Add onTap to navigate to client details
            ),
          ),
          const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('GI')), // Placeholder
              title: Text('Globex Inc.'),
              subtitle: Text('MRR: \$1,800 | Status: Active'),
              trailing: Icon(Icons.chevron_right),
              // TODO: Add onTap to navigate to client details
            ),
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
      // TODO: Add FloatingActionButton for adding new clients?
    );
  }
}

