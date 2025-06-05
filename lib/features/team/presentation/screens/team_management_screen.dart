import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Fetch and display team members, handle role views, tasks, time tracking, offline storage

class TeamManagementScreen extends ConsumerWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch relevant providers for team data (members, tasks)
    // TODO: Check user role to determine view (Founder vs Employee)
    // final userRole = ref.watch(currentUserProvider).role;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Management'),
        // TODO: Add actions (e.g., Add Member, Assign Task - Founder only)
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Team Members', // TODO: Fetch and display member list
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // TODO: Replace with actual member list widgets (e.g., ListView.builder with Card/ListTile)
          const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('JD')), // Placeholder
              title: Text('John Doe'),
              subtitle: Text('Role: Employee | Tasks: 5'),
              trailing: Icon(Icons.chevron_right),
              // TODO: Add onTap to navigate to member details/tasks (Founder view)
            ),
          ),
          const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('JS')), // Placeholder
              title: Text('Jane Smith'),
              subtitle: Text('Role: Employee | Tasks: 3'),
              trailing: Icon(Icons.chevron_right),
              // TODO: Add onTap to navigate to member details/tasks (Founder view)
            ),
          ),
          const SizedBox(height: 24),

          // --- Tasks Section (Maybe conditional based on view) ---
          Text(
            'Assigned Tasks', // Or 'My Tasks' for employee view
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // TODO: Display list of tasks (all for founder, assigned for employee)
          const ListTile(
            leading: Icon(Icons.task_alt),
            title: Text('Update Client X Report'),
            subtitle: Text('Due: Tomorrow | Assigned to: John Doe'),
          ),
          const ListTile(
            leading: Icon(Icons.task_alt),
            title: Text('Prepare Sales Pitch Deck'),
            subtitle: Text('Due: Friday | Assigned to: Jane Smith'),
          ),
          const SizedBox(height: 24),

          // --- Time Tracking Section (Maybe Founder only or separate screen) ---
          Text(
            'Time Tracking Overview', 
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          // TODO: Display time tracking summary or link to detailed view
          const Text('Time tracking data placeholder...'),
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
      // TODO: Add FloatingActionButton for adding tasks/members (Founder only)?
    );
  }
}

