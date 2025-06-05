import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remote_armz/app/routes/app_router.dart';
import 'package:remote_armz/features/authentication/presentation/providers/auth_providers.dart';

// TODO: Implement actual UI based on design specs

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  // Controllers for email and password fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch auth state/form state provider for loading/error states
    // final authState = ref.watch(authFormStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            // TODO: Add loading indicator based on authState.isLoading
            ElevatedButton(
              onPressed: () {
                // TODO: Call login method from auth provider/notifier
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                if (email.isNotEmpty && password.isNotEmpty) {
                  // Example: ref.read(authFormStateProvider.notifier).loginWithEmail(email, password);
                  print('Login attempt: $email'); // Placeholder
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to Forgot Password screen
                AppRouter.router.push(AppRouter.forgotPasswordPath);
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.login), // Placeholder for Google icon
              label: const Text('Sign in with Google'),
              onPressed: () {
                // TODO: Call Google Sign In method from auth provider/notifier
                // Example: ref.read(authFormStateProvider.notifier).loginWithGoogle();
                 print('Google Sign In attempt'); // Placeholder
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                // backgroundColor: Colors.white, // Example styling
                // foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                // Navigate to Register screen
                AppRouter.router.push(AppRouter.registerPath);
              },
              child: const Text('Don\'t have an account? Register'),
            ),
            // TODO: Display error messages based on authState.error
          ],
        ),
      ),
    );
  }
}

