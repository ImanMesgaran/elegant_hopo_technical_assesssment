import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elegant_hopo_technical_assessment/features/auth/data/models/auth_user_model.dart';

/// Local data source for authentication operations.
abstract class AuthLocalDataSource {
  const AuthLocalDataSource();

  /// Caches the authenticated user.
  Future<void> cacheUser(AuthUserModel user);

  /// Gets the cached user.
  Future<AuthUserModel?> getCachedUser();

  /// Clears the cached user.
  Future<void> clearCachedUser();
}

/// Implementation of the local data source for authentication.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({required this.sharedPreferences});

  /// The shared preferences instance.
  final SharedPreferences sharedPreferences;

  /// The key for storing the authenticated user.
  static const String cachedUserKey = 'CACHED_USER';

  @override
  Future<void> cacheUser(AuthUserModel user) async {
    await sharedPreferences.setString(cachedUserKey, jsonEncode(user.toJson()));
  }

  @override
  Future<AuthUserModel?> getCachedUser() async {
    final jsonString = sharedPreferences.getString(cachedUserKey);
    if (jsonString == null) {
      return null;
    }

    try {
      return AuthUserModel.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearCachedUser() async {
    await sharedPreferences.remove(cachedUserKey);
  }
}
