
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';
import 'get_all_characters.dart';

class GetAllLocalCharacters implements UseCase<List<CharacterLocal>, GetCharacterParams> {
  final HomeRepository homeRepository;
  GetAllLocalCharacters(this.homeRepository);

  @override
  Future<Either<Failure, List<CharacterLocal>>> call(GetCharacterParams params) async {
    return await homeRepository.getLocalAllcharacters(params.status,params.search);
  }
}
