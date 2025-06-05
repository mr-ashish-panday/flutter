import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remote_armz/app/routes/app_router.dart';
import 'package:remote_armz/features/authentication/presentation/providers/auth_providers.dart';

// TODO: Implement actual UI based on design specs

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  // Controller for email field
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch auth state/form state provider for loading/error states
    // final authState = ref.watch(authFormStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email address and we will send you instructions to reset your password.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            // TODO: Add loading indicator based on authState.isLoading
            ElevatedButton(
              onPressed: () {
                // TODO: Call password reset method from auth provider/notifier
                final email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  // Example: ref.read(authFormStateProvider.notifier).sendPasswordReset(email);
                  print('Password reset attempt for: $email'); // Placeholder
                  // Optionally show a confirmation message and pop the screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password reset email sent (if account exists).')),
                  );
                  // Consider popping only after successful API call confirmation
                  if (AppRouter.router.canPop()) {
                     AppRouter.router.pop();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width
              ),
              child: const Text('Send Reset Instructions'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                 // Navigate back to Login screen
                  if (AppRouter.router.canPop()) {
                    AppRouter.router.pop();
                  } else {
                    AppRouter.router.go(AppRouter.loginPath);
                  }
              },
              child: const Text('Back to Login'),
            ),
            // TODO: Display error messages based on authState.error
          ],
        ),
      ),
    );
  }
}

