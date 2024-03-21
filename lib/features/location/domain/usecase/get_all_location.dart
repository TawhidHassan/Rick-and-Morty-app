
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/repository/location_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetAllLocation implements UseCase<List<Location>, GetLocationParams> {
  final LocationRepository locationRepository;
  GetAllLocation(this.locationRepository);

  @override
  Future<Either<Failure, List<Location>>> call(GetLocationParams params) async {
    return await locationRepository.getAllLocation(params.page);
  }
}


class GetLocationParams {
  final int? page;

  GetLocationParams({
     this.page,

  });
}