import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../network/network_client.dart';
import '../../features/home/domain/usecases/get_home_items.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/data/datasources/home_remote_datasource.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';

/// {@template injection}
/// Global service locator for dependency injection.
/// {@endtemplate}
final GetIt getIt = GetIt.instance;

/// {@macro injection}
Future<void> configureDependencies() async {
  // Register core dependencies
  getIt.registerLazySingleton<Logger>(() => Logger());
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<NetworkClient>(
    () => NetworkClient(client: getIt(), logger: getIt()),
  );

  // Register data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(getIt()),
  );

  // Register repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt(), getIt()),
  );

  // Register use cases
  getIt.registerLazySingleton<GetHomeItems>(() => GetHomeItems(getIt()));

  // Register BLoCs
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
}
