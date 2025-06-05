import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: Import actual screen widgets once they are created
// Example placeholder screens:
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title - Coming Soon')),
    );
  }
}

class AppRouter {
  // Define route paths
  static const String loginPath = '/login';
  static const String registerPath = '/register';
  static const String forgotPasswordPath = '/forgot-password';
  static const String dashboardPath = '/dashboard'; // Base for founder/employee
  static const String outreachPath = '/outreach';
  static const String crmPath = '/crm';
  static const String clientsPath = '/clients';
  static const String exitPrepPath = '/exit-prep';
  static const String teamPath = '/team';
  static const String analyticsPath = '/analytics';
  static const String settingsPath = '/settings';
  static const String myTasksPath = '/my-tasks'; // Employee specific
  static const String trainingPath = '/training'; // Employee specific
  static const String timeTrackingPath = '/time-tracking'; // Employee specific
  static const String messagesPath = '/messages'; // Employee specific

  // TODO: Add logic to determine initial route based on auth state
  static final GoRouter router = GoRouter(
    initialLocation: loginPath, // Default to login
    routes: [
      GoRoute(
        path: loginPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Login'),
      ),
      GoRoute(
        path: registerPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Register'),
      ),
       GoRoute(
        path: forgotPasswordPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Forgot Password'),
      ),
      // TODO: Add ShellRoute for main app navigation (Founder/Employee)
      GoRoute(
        path: dashboardPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Dashboard'),
      ),
       GoRoute(
        path: outreachPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Outreach Tracker'),
      ),
       GoRoute(
        path: crmPath,
        builder: (context, state) => const PlaceholderScreen(title: 'CRM'),
      ),
       GoRoute(
        path: clientsPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Client Management'),
      ),
       GoRoute(
        path: exitPrepPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Exit Readiness'),
      ),
       GoRoute(
        path: teamPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Team Management'),
      ),
       GoRoute(
        path: analyticsPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Analytics'),
      ),
       GoRoute(
        path: settingsPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Settings'),
      ),
      // Employee specific routes (might be nested under a different shell)
       GoRoute(
        path: myTasksPath,
        builder: (context, state) => const PlaceholderScreen(title: 'My Tasks'),
      ),
       GoRoute(
        path: trainingPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Training'),
      ),
       GoRoute(
        path: timeTrackingPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Time Tracking'),
      ),
       GoRoute(
        path: messagesPath,
        builder: (context, state) => const PlaceholderScreen(title: 'Messages'),
      ),
      // TODO: Add routes for specific sub-screens (e.g., client details, lead details)
    ],
    // TODO: Add error handling for unknown routes
    // errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}

