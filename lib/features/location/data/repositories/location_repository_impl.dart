import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/exceptions.dart';
import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/location_repository.dart';
import '../datasource/location_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;
  final ConnectionChecker connectionChecker;
  LocationRepositoryImpl(
    this.locationRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Location>>> getAllLocation(int?page)async {
    // TODO: implement getAllcharacters
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final locations = await locationRemoteDataSource.getAllLocationss(page);
        if(locations!.results==null){
          return left(Failure(locations.error!));
        }else{
          return right(locations.results!);
        }
        // return right(locations!.results!);
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }





}
