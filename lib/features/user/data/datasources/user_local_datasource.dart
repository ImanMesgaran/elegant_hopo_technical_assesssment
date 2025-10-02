import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elegant_hopo_technical_assessment/features/user/data/models/user_model.dart';

/// Local data source for user data.
abstract class UserLocalDataSource {
  const UserLocalDataSource();

  /// Gets a user by ID from local storage.
  Future<UserModel?> getUser(String id);

  /// Gets all users from local storage.
  Future<List<UserModel>> getUsers();

  /// Caches a user locally.
  Future<void> cacheUser(UserModel user);

  /// Caches multiple users locally.
  Future<void> cacheUsers(List<UserModel> users);

  /// Removes a user from local storage.
  Future<void> removeUser(String id);

  /// Clears all cached users.
  Future<void> clearUsers();
}

/// Implementation of the local data source.
class UserLocalDataSourceImpl implements UserLocalDataSource {
  const UserLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const String _usersKey = 'cached_users';
  static const String _userPrefix = 'user_';

  @override
  Future<UserModel?> getUser(String id) async {
    final userJson = sharedPreferences.getString('$_userPrefix$id');
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final usersJson = sharedPreferences.getStringList(_usersKey) ?? [];
    return usersJson
        .map(
          (json) =>
              UserModel.fromJson(jsonDecode(json) as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await sharedPreferences.setString('$_userPrefix${user.id}', userJson);
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    final usersJson = users.map((user) => jsonEncode(user.toJson())).toList();
    await sharedPreferences.setStringList(_usersKey, usersJson);
  }

  @override
  Future<void> removeUser(String id) async {
    await sharedPreferences.remove('$_userPrefix$id');
  }

  @override
  Future<void> clearUsers() async {
    await sharedPreferences.remove(_usersKey);
  }
}
