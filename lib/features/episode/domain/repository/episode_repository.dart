import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failures.dart';
import '../entities/episode.dart';


abstract interface class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> getAllEpisode(int? page);
}
