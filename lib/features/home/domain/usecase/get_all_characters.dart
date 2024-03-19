
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetAllCharacters implements UseCase<List<Character>, NoParams> {
  final HomeRepository homeRepository;
  GetAllCharacters(this.homeRepository);

  @override
  Future<Either<Failure, List<Character>>> call(NoParams params) async {
    return await homeRepository.getAllcharacters();
  }
}
