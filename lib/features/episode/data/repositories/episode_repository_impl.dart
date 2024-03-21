import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/exceptions.dart';
import 'package:rick_and_morty/core/error/failures.dart';

import '../../../../../core/network/connection_checker.dart';
import '../../domain/entities/episode.dart';
import '../../domain/repository/episode_repository.dart';
import '../datasource/Episode_remote_data_source.dart';



class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSource episodeRemoteDataSource;
  final ConnectionChecker connectionChecker;
  EpisodeRepositoryImpl(
    this.episodeRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Episode>>> getAllEpisode(int?page)async {
    // TODO: implement getAllcharacters
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final episodes = await episodeRemoteDataSource.getAllEpisodess(page);
        if(episodes!.results==null){
          return left(Failure(episodes!.error!));
        }else{
          return right(episodes!.results!);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }





}
