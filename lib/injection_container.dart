import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/system/data/datasources/system_local_data_source.dart';
import 'features/system/data/datasources/system_remote_data_source.dart';
import 'features/system/data/repositories/system_repository_impl.dart';
import 'features/system/domain/repositories/system_repository.dart';
import 'features/system/domain/usecases/get_system_status.dart';
import 'features/system/domain/usecases/update_system_parameter.dart';
import 'features/system/domain/usecases/start_system.dart';
import 'features/system/domain/usecases/stop_system.dart';
import 'features/system/domain/usecases/get_operation_history.dart';
import 'features/system/domain/usecases/get_system_updates.dart';
import 'features/system/presentation/bloc/system_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - System
  // Bloc
  sl.registerFactory(
        () => SystemBloc(
      getSystemStatus: sl(),
      updateSystemParameter: sl(),
      startSystem: sl(),
      stopSystem: sl(),
      getOperationHistory: sl(),
      getSystemUpdates: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSystemStatus(sl()));
  sl.registerLazySingleton(() => UpdateSystemParameter(sl()));
  sl.registerLazySingleton(() => StartSystem(sl()));
  sl.registerLazySingleton(() => StopSystem(sl()));
  sl.registerLazySingleton(() => GetOperationHistory(sl()));
  sl.registerLazySingleton(() => GetSystemUpdates(sl()));

  // Repository
  sl.registerLazySingleton<SystemRepository>(
        () => SystemRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SystemRemoteDataSource>(
        () => SystemRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<SystemLocalDataSource>(
        () => SystemLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}