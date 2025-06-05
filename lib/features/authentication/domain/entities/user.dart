# Entities related to Authentication

import 'package:equatable/equatable.dart';

// Represents the authenticated user
class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String role; // 'founder' or 'employee'

  const User({
    required this.id,
    this.email,
    this.name,
    this.photoUrl,
    required this.role,
  });

  // Represents an unauthenticated user
  static const empty = User(id: '', role: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name, photoUrl, role];
}

