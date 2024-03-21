import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

import '../../../../core/error/failures.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, List<Location>>> getAllLocation(int? page);
}
