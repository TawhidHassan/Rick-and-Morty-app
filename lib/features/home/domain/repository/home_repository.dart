import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/failures.dart';

abstract interface class HomeRepository {

  Future<Either<Failure, List<Character>>> getAllcharacters(String? status,search,int? page);
  Future<Either<Failure, Character>> getcharacterDetails(int? id);


  ///locally save
  Future<Either<Failure, List<CharacterLocal>>> getLocalAllcharacters(String? status,search);
  Future<Either<Failure, CharacterLocal>> uploadLocaldata(CharacterLocal characterLocal);
  Future<Either<Failure, CharacterLocal>> removeLocaldata(int id);

}
