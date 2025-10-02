import 'package:elegant_hopo_technical_assessment/core/network/network_client.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/models/user_model.dart';

/// Remote data source for user data.
abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  /// Gets a user by ID from the remote server.
  Future<UserModel> getUser(String id);

  /// Gets all users from the remote server.
  Future<List<UserModel>> getUsers();

  /// Creates a new user on the remote server.
  Future<UserModel> createUser(UserModel user);

  /// Updates an existing user on the remote server.
  Future<UserModel> updateUser(UserModel user);

  /// Deletes a user by ID from the remote server.
  Future<void> deleteUser(String id);
}

/// Implementation of the remote data source.
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl({required this.networkClient});

  final NetworkClient networkClient;

  @override
  Future<UserModel> getUser(String id) async {
    // This is a mock implementation
    // In a real app, you would make an actual API call here
    await Future<void>.delayed(const Duration(seconds: 1));

    return const UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatar: 'https://example.com/avatar.jpg',
      phoneNumber: '+1234567890',
      createdAt: null,
      updatedAt: null,
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(seconds: 1));

    return [
      const UserModel(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        avatar: 'https://example.com/avatar1.jpg',
        phoneNumber: '+1234567890',
        createdAt: null,
        updatedAt: null,
      ),
      const UserModel(
        id: '2',
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        avatar: 'https://example.com/avatar2.jpg',
        phoneNumber: '+0987654321',
        createdAt: null,
        updatedAt: null,
      ),
      const UserModel(
        id: '3',
        name: 'Bob Johnson',
        email: 'bob.johnson@example.com',
        avatar: 'https://example.com/avatar3.jpg',
        phoneNumber: '+1122334455',
        createdAt: null,
        updatedAt: null,
      ),
    ];
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return user.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return user.copyWith(updatedAt: DateTime.now());
  }

  @override
  Future<void> deleteUser(String id) async {
    // This is a mock implementation
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
}
