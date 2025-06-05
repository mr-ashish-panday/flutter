import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remote_armz/app/routes/app_router.dart';
import 'package:remote_armz/features/authentication/presentation/providers/auth_providers.dart';

// TODO: Implement actual UI based on design specs

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  // Controllers for email and password fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch auth state/form state provider for loading/error states
    // final authState = ref.watch(authFormStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Added for scrollability if content overflows
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
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              // TODO: Add loading indicator based on authState.isLoading
              ElevatedButton(
                onPressed: () {
                  // TODO: Call signup method from auth provider/notifier
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();
                  final confirmPassword = _confirmPasswordController.text.trim();

                  if (email.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
                    // Example: ref.read(authFormStateProvider.notifier).signUp(email, password);
                    print('Register attempt: $email'); // Placeholder
                  } else if (password != confirmPassword) {
                    // TODO: Show password mismatch error
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                child: const Text('Register'),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  // Navigate back to Login screen
                  if (AppRouter.router.canPop()) {
                    AppRouter.router.pop();
                  } else {
                    AppRouter.router.go(AppRouter.loginPath);
                  }
                },
                child: const Text('Already have an account? Login'),
              ),
              // TODO: Display error messages based on authState.error
            ],
          ),
        ),
      ),
    );
  }
}

