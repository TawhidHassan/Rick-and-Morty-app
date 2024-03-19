part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initHome();


  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
  //
  // serviceLocator.registerLazySingleton(() => supabase.client);
  //
  // serviceLocator.registerLazySingleton(
  //   () => Hive.box(name: 'blogs'),
  // );

  serviceLocator.registerFactory(() => InternetConnection());

  // core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<ApiMethod>(
    () => ApiMethod(),
  );
}

void _initHome() {
  /// Datasource
  serviceLocator
    ..registerFactory<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
  /// Repository
    ..registerFactory<HomeRepository>(
          () => HomeRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
  /// Usecases
    ..registerFactory(
          () => GetAllCharacters(
        serviceLocator(),
      ),
    )
  // Bloc
    ..registerLazySingleton(
          () => HomeBloc(
            getAllCharacters: serviceLocator()
      ),
    );

}


