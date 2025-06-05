import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remote_armz/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:remote_armz/features/authentication/domain/entities/user.dart';
import 'package:remote_armz/features/authentication/domain/repositories/authentication_repository.dart';

// Provider for the AuthenticationRepository implementation
final authenticationRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  // TODO: Inject Firebase Auth, Google Sign In, Firestore instances if needed for testing/mocking
  return AuthenticationRepositoryImpl();
});

// Provider for the authentication state stream
final authStateChangesProvider = StreamProvider<User>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return authRepository.user;
});

// Provider for managing the state of authentication forms (e.g., login, signup)
// This could be a StateNotifierProvider holding email, password, loading state, error state etc.
// Example (needs a StateNotifier class defined):
/*
final authFormStateProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>((ref) {
  final authRepository = ref.watch(authenticationRepositoryProvider);
  return AuthFormNotifier(authRepository);
});
*/

// Provider to expose the current user easily
final currentUserProvider = Provider<User>((ref) {
  // Watch the auth state stream provider
  final authState = ref.watch(authStateChangesProvider);
  // Return the user data from the stream's current state, or User.empty if no user
  return authState.maybeWhen(
    data: (user) => user,
    orElse: () => User.empty,
  );
});

