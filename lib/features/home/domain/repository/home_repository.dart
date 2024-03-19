import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';

abstract interface class HomeRepository {

  Future<Either<Failure, List<Character>>> getAllcharacters();
}
