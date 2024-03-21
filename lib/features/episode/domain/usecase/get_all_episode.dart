
import 'package:fpdart/fpdart.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../repository/episode_repository.dart';

class GetAllEpisode implements UseCase<List<Episode>, GetEpisodeParams> {
  final EpisodeRepository episodeRepository;
  GetAllEpisode(this.episodeRepository);

  @override
  Future<Either<Failure, List<Episode>>> call(GetEpisodeParams params) async {
    return await episodeRepository.getAllEpisode(params.page);
  }
}


class GetEpisodeParams {
  final int? page;

  GetEpisodeParams({
     this.page,

  });
}