part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initHome();


  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  ///db
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );

  ///Api client
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
    ..registerFactory<HomeLocalDataSource>(
          () => HomeLocalDataSourceImpl(
           dbHelper:  serviceLocator(),
      ),
    )
  /// Repository
    ..registerFactory<HomeRepository>(
          () => HomeRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),

      ),
    )
  /// Usecases
    ..registerFactory(
          () => GetAllCharacters(
        serviceLocator(),
      ),
    ) ..registerFactory(
          () => GetCharacterDetails(
        serviceLocator(),
      ),
    )..registerFactory(
          () => SaveLoacalCharacter(
        serviceLocator(),
      ),
    )..registerFactory(
          () => GetAllLocalCharacters(
        serviceLocator(),
      ),
    )..registerFactory(
          () => RemoveLoacalCharacter(
        serviceLocator(),
      ),
    )
  // Bloc
    ..registerLazySingleton(
          () => HomeBloc(
            getAllCharacters: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
          () => CastBloc(
            getAllCharacters: serviceLocator()
      ),
    ) ..registerLazySingleton(
          () => CastDetailsBloc(
            getCharacterDetails: serviceLocator(),

      ),
    )..registerLazySingleton(
          () => LocalBloc(
              getAllLocalCharacters: serviceLocator(),
            saveLoacalCharacter: serviceLocator(),
            removeLoacalCharacter: serviceLocator(),
          ),
    )..registerLazySingleton(
          () => LocalCastBloc(
              getAllLocalCharacters: serviceLocator(),
            saveLoacalCharacter: serviceLocator(),
            removeLoacalCharacter: serviceLocator(),
          ),
    );

}


