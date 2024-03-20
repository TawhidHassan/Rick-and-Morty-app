
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetAllCharacters implements UseCase<List<Character>, GetCharacterParams> {
  final HomeRepository homeRepository;
  GetAllCharacters(this.homeRepository);

  @override
  Future<Either<Failure, List<Character>>> call(GetCharacterParams params) async {
    return await homeRepository.getAllcharacters(params.status,params.search,params.page);
  }
}


class GetCharacterParams {
  final String? status;
  final String? search;
  final int? page;

  GetCharacterParams({
     this.status,
     this.search,
     this.page,

  });
}