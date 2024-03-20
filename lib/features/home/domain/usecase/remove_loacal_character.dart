
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class RemoveLoacalCharacter implements UseCase<CharacterLocal, RemoveCharacterParams> {
  final HomeRepository homeRepository;
  RemoveLoacalCharacter(this.homeRepository);

  @override
  Future<Either<Failure, CharacterLocal>> call(RemoveCharacterParams params) async {
    return await homeRepository.removeLocaldata(params.id!);
  }
}


class RemoveCharacterParams {
  final int? id;
  RemoveCharacterParams({
     this.id,

  });
}