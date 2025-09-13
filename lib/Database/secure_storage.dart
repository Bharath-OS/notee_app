import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService{
  static const String usernameKey = 'usernameKey';
  static const String emailKey = 'emailKey';
  static const String passwordKey = 'passwordKey';

  // Private constructor
  AuthService._internal();

  // The single instance (singleton)
  static final AuthService _instance = AuthService._internal();

  // Expose the instance
  factory AuthService() => _instance;

  // Secure storage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save user credentials
  Future<void> saveUser({
    required String name,
    required String email,
    required String password,
  }) async {
    await _storage.write(key: usernameKey, value: name);
    await _storage.write(key: emailKey, value: email);
    await _storage.write(key: passwordKey, value: password);
  }

  // Get user credentials
  Future<Map<String, String?>> getUser() async {
    final name = await _storage.read(key: usernameKey);
    final email = await _storage.read(key: emailKey);
    final password = await _storage.read(key: passwordKey);
    return {
      usernameKey: name,
      emailKey: email,
      passwordKey: password,
    };
  }
}