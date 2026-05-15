import 'package:travel_app/database/db_helper.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  AuthService._internal();
  Map<String, dynamic>? currentUser;

  int? get currentUserId => currentUser?['id'] as int?;
  String? get currentUserName => currentUser?['name'] as String?;
  String? get currentUserEmail => currentUser?['email'] as String?;

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (name.trim().isEmpty) return 'Please enter your name.';
    if (email.trim().isEmpty) return 'Please enter your email.';
    if (password.length < 6) return 'Password must be at least 6 characters.';
    if (!email.contains('@')) return 'Please enter a valid email.';

    final newId = await DatabaseHelper.instance.signUp(
      name: name.trim(),
      email: email.trim(),
      password: password,
    );

    if (newId == null) {
      return 'This email is already registered. Please log in.';
    }
    currentUser = {'id': newId, 'name': name.trim(), 'email': email.trim()};
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    if (email.trim().isEmpty) return 'Please enter your email.';
    if (password.isEmpty) return 'Please enter your password.';

    final user = await DatabaseHelper.instance.login(
      email: email.trim(),
      password: password,
    );

    if (user == null) {
      return 'Wrong email or password. Please try again.';
    }
    currentUser = user;
    return null;
  }

  void logout() {
    currentUser = null;
  }

  bool get isLoggedIn => currentUser != null;
}