import '../../../../core/network/network_client.dart';
import '../models/home_model.dart';

/// {@template home_remote_datasource}
/// Remote data source for home data.
/// {@endtemplate}
class HomeRemoteDataSource {
  /// {@macro home_remote_datasource}
  const HomeRemoteDataSource(this._networkClient);

  final NetworkClient _networkClient;

  /// Gets all home items from the remote server.
  Future<List<HomeModel>> getHomeItems() async {
    // This is a mock implementation
    // In a real app, you would make an actual API call here
    await Future.delayed(const Duration(seconds: 1));

    return [
      const HomeModel(
        id: '1',
        title: 'Welcome to Technical Challenge',
        description:
            'This is a sample home item created with Very Good CLI structure.',
        isCompleted: false,
        createdAt: null,
        updatedAt: null,
      ),
      const HomeModel(
        id: '2',
        title: 'Flutter Architecture',
        description: 'Clean Architecture with BLoC pattern implementation.',
        isCompleted: true,
        createdAt: null,
        updatedAt: null,
      ),
      const HomeModel(
        id: '3',
        title: 'Dependency Injection',
        description: 'Using GetIt and Injectable for dependency management.',
        isCompleted: false,
        createdAt: null,
        updatedAt: null,
      ),
    ];
  }

  /// Gets a specific home item by ID from the remote server.
  Future<HomeModel> getHomeItem(String id) async {
    // This is a mock implementation
    await Future.delayed(const Duration(milliseconds: 500));

    return const HomeModel(
      id: '1',
      title: 'Sample Home Item',
      description: 'This is a sample home item.',
      isCompleted: false,
      createdAt: null,
      updatedAt: null,
    );
  }

  /// Creates a new home item on the remote server.
  Future<HomeModel> createHomeItem(HomeModel item) async {
    // This is a mock implementation
    await Future.delayed(const Duration(milliseconds: 500));

    return item.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Updates an existing home item on the remote server.
  Future<HomeModel> updateHomeItem(HomeModel item) async {
    // This is a mock implementation
    await Future.delayed(const Duration(milliseconds: 500));

    return item.copyWith(updatedAt: DateTime.now());
  }

  /// Deletes a home item by ID from the remote server.
  Future<void> deleteHomeItem(String id) async {
    // This is a mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

/// {@template server_exception}
/// Exception thrown when server returns an error.
/// {@endtemplate}
class ServerException implements Exception {
  /// {@macro server_exception}
  const ServerException(this.message);

  final String message;
}

/// {@template network_exception}
/// Exception thrown when network request fails.
/// {@endtemplate}
class NetworkException implements Exception {
  /// {@macro network_exception}
  const NetworkException(this.message);

  final String message;
}
