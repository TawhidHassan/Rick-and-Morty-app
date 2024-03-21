part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}


final class EpisodeLoading extends EpisodeState {
  final List<Episode>? oldEpisode;
  final bool? isFirstFetch;

  EpisodeLoading({this.oldEpisode, this.isFirstFetch});
}

final class EpisodeFailure extends EpisodeState {
  final String error;
  EpisodeFailure(this.error);
}

final class EpisodeDisplaySuccess extends EpisodeState {
  final List<Episode>? episode;
  EpisodeDisplaySuccess({this.episode});
}