import 'package:remote_armz/features/authentication/domain/entities/user.dart';

// Abstract interface for authentication operations
abstract class AuthenticationRepository {
  // Stream to listen for authentication state changes
  Stream<User> get user;

  // Sign up with email and password
  Future<void> signUp({required String email, required String password});

  // Log in with email and password
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // Log in with Google
  Future<void> logInWithGoogle();

  // Log out
  Future<void> logOut();

  // Send password reset email
  Future<void> sendPasswordResetEmail({required String email});

  // TODO: Add methods for MFA if needed (e.g., verifyPhoneNumber, verifyOTP)
}

