import 
    'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remote_armz/features/authentication/domain/entities/user.dart';
import 'package:remote_armz/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Implementation of the AuthenticationRepository using Firebase
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthenticationRepositoryImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firestore = firestore ?? FirebaseFirestore.instance;

  // Maps Firebase user to our domain User entity
  // TODO: Fetch role from Firestore or custom claims
  User _mapFirebaseUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      return User.empty;
    }
    // Placeholder for role - needs implementation to fetch from Firestore/claims
    String role = 'employee'; // Default or fetch logic needed
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email,
      name: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      role: role, // Needs actual implementation
    );
  }

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map(_mapFirebaseUser);
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // TODO: Create user document in Firestore with default role (e.g., 'employee')
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'role': 'employee', // Default role, founder might need manual setup or different flow
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      // TODO: Handle specific Firebase auth exceptions (weak-password, email-already-in-use)
      print('Sign up failed: $e'); // Replace with proper error handling
      rethrow; // Rethrow for presentation layer handling
    } catch (e) {
      print('Sign up failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      // TODO: Handle specific Firebase auth exceptions (user-not-found, wrong-password)
      print('Log in failed: $e');
      rethrow;
    } catch (e) {
      print('Log in failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final firebase_auth.AuthCredential credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      // TODO: Check if user exists in Firestore, if not, create document
      if (userCredential.user != null && userCredential.additionalUserInfo?.isNewUser == true) {
         await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': userCredential.user!.email,
          'name': userCredential.user!.displayName,
          'photoUrl': userCredential.user!.photoURL,
          'role': 'employee', // Default role
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true)); // Merge in case doc exists but needs update
      }

    } on firebase_auth.FirebaseAuthException catch (e) {
      print('Google sign in failed: $e');
      rethrow;
    } catch (e) {
      print('Google sign in failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Log out failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('Password reset failed: $e');
      rethrow;
    } catch (e) {
      print('Password reset failed: $e');
      rethrow;
    }
  }
}

