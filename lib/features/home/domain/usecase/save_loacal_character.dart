
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class SaveLoacalCharacter implements UseCase<CharacterLocal, SaveCharacterParams> {
  final HomeRepository homeRepository;
  SaveLoacalCharacter(this.homeRepository);

  @override
  Future<Either<Failure, CharacterLocal>> call(SaveCharacterParams params) async {
    return await homeRepository.uploadLocaldata(params.characterLocal!);
  }
}


class SaveCharacterParams {
  final CharacterLocal? characterLocal;
  SaveCharacterParams({
     this.characterLocal,

  });
}