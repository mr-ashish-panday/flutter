import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Implement actual UI based on design specs
// TODO: Add providers for managing settings (e.g., theme, notifications)
// Example theme provider (needs definition elsewhere):
// final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch settings providers
    // final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Appearance',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          // --- Theme Selection ---
          ListTile(
            title: const Text('Theme'),
            subtitle: const Text('System Default'), // TODO: Update based on provider state
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Show theme selection dialog (Light, Dark, System)
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Select Theme'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile<ThemeMode>(
                        title: const Text('Light'),
                        value: ThemeMode.light,
                        groupValue: ThemeMode.system, // TODO: Use provider value
                        onChanged: (ThemeMode? value) {
                          // TODO: Update theme provider
                          // ref.read(themeModeProvider.notifier).state = value!;
                          Navigator.pop(context);
                        },
                      ),
                      RadioListTile<ThemeMode>(
                        title: const Text('Dark'),
                        value: ThemeMode.dark,
                        groupValue: ThemeMode.system, // TODO: Use provider value
                        onChanged: (ThemeMode? value) {
                           // TODO: Update theme provider
                          // ref.read(themeModeProvider.notifier).state = value!;
                          Navigator.pop(context);
                        },
                      ),
                      RadioListTile<ThemeMode>(
                        title: const Text('System Default'),
                        value: ThemeMode.system,
                        groupValue: ThemeMode.system, // TODO: Use provider value
                        onChanged: (ThemeMode? value) {
                           // TODO: Update theme provider
                          // ref.read(themeModeProvider.notifier).state = value!;
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(),

          Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          // --- Notification Preferences ---
          SwitchListTile(
            title: const Text('Outreach Reminders'),
            value: true, // TODO: Use provider value
            onChanged: (bool value) {
              // TODO: Update notification preference provider
            },
          ),
          SwitchListTile(
            title: const Text('Task Alerts'),
            value: true, // TODO: Use provider value
            onChanged: (bool value) {
              // TODO: Update notification preference provider
            },
          ),
          const Divider(),

          Text(
            'Account',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          // --- Account Actions ---
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              // TODO: Call logout method from auth provider
              // ref.read(authFormStateProvider.notifier).logout();
              // Navigate to login screen after logout
              AppRouter.router.go(AppRouter.loginPath);
            },
          ),
          // TODO: Add other settings like profile update, password change etc.
        ],
      ),
    );
  }
}

