import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/usecase/get_all_episode.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetAllEpisode _getAllEpisode;
  EpisodeBloc({required GetAllEpisode getAllEpisode}) :_getAllEpisode=getAllEpisode,super(EpisodeInitial()) {
    on<EpisodeFetchAll>(_onFetchAllEpisode);
  }



  int page=1;
  void _onFetchAllEpisode(
      EpisodeFetchAll event,
      Emitter<EpisodeState> emit,) async{

    final currentState = state;
    var oldLocation = <Episode>[];

    if (currentState is EpisodeDisplaySuccess) {
      oldLocation = currentState.episode!;
    }
    emit(EpisodeLoading(oldEpisode:  oldLocation, isFirstFetch: page == 2,));

    ///data call
    final res = await _getAllEpisode(GetEpisodeParams(page: page));


    res.fold(
          (l) {
            if(l.message=="There is nothing here"){
              final locations= (state as EpisodeLoading).oldEpisode;
              emit(EpisodeDisplaySuccess(episode: locations ));
            }else{
              emit(EpisodeFailure(l.message));
            }
          },
          (r) {
        page++;
        if(state is EpisodeLoading){
          final locations= (state as EpisodeLoading).oldEpisode;
          locations!.addAll(r);
          emit(EpisodeDisplaySuccess(episode: locations ));
        }else{
          emit(EpisodeDisplaySuccess(episode: r ));

        }
      },
    );
  }
}

