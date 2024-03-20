
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../home/domain/repository/home_repository.dart';

class GetCharacterDetails implements UseCase<Character, GetCharacterDeatilsParams> {
  final HomeRepository homeRepository;
  GetCharacterDetails(this.homeRepository);

  @override
  Future<Either<Failure, Character>> call(GetCharacterDeatilsParams params) async {
    return await homeRepository.getcharacterDetails(params.id);
  }
}


class GetCharacterDeatilsParams {
  final int? id;

  GetCharacterDeatilsParams({
     this.id,

  });
}