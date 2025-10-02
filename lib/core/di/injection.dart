import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elegant_hopo_technical_assessment/core/network/network_client.dart';
import 'package:elegant_hopo_technical_assessment/core/network/network_info.dart';

// User feature
import 'package:elegant_hopo_technical_assessment/features/user/data/datasources/user_local_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/datasources/user_remote_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/user/data/repositories/user_repository_impl.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/create_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/delete_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_users.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/update_user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/presentation/bloc/user_bloc.dart';

// Auth feature
import 'package:elegant_hopo_technical_assessment/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/repositories/auth_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/get_current_user.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_in.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_out.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/domain/usecases/sign_up.dart';
import 'package:elegant_hopo_technical_assessment/features/auth/presentation/bloc/auth_bloc.dart';

/// Global service locator for dependency injection.
final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Initialize shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register core dependencies
  getIt.registerLazySingleton(() => Logger());
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => sharedPreferences);

  // Register network dependencies
  getIt.registerLazySingleton(
    () => NetworkClient(client: getIt(), logger: getIt()),
  );
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Register User feature
  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(networkClient: getIt()),
  );
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetUsers(getIt()));
  getIt.registerLazySingleton(() => GetUser(getIt()));
  getIt.registerLazySingleton(() => CreateUser(getIt()));
  getIt.registerLazySingleton(() => UpdateUser(getIt()));
  getIt.registerLazySingleton(() => DeleteUser(getIt()));

  // BLoCs
  getIt.registerFactory(
    () => UserBloc(
      getUsers: getIt(),
      getUser: getIt(),
      createUser: getIt(),
      updateUser: getIt(),
      deleteUser: getIt(),
    ),
  );

  // Register Auth feature
  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(networkClient: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCurrentUser(getIt()));
  getIt.registerLazySingleton(() => SignIn(getIt()));
  getIt.registerLazySingleton(() => SignUp(getIt()));
  getIt.registerLazySingleton(() => SignOut(getIt()));

  // BLoCs
  getIt.registerFactory(
    () => AuthBloc(
      getCurrentUser: getIt(),
      signIn: getIt(),
      signUp: getIt(),
      signOut: getIt(),
    ),
  );
}
