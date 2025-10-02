import 'package:equatable/equatable.dart';

/// Entity representing user login credentials.
class Credentials extends Equatable {
  const Credentials({required this.email, required this.password});

  /// User's email address
  final String email;

  /// User's password
  final String password;

  @override
  List<Object> get props => [email, password];
}
