part of 'cast_bloc.dart';

@immutable
abstract class CastState {}

class CastInitial extends CastState {}

final class CastLoading extends CastState {
  final List<Character>? oldCharacters;
  final bool? isFirstFetch;

  CastLoading({this.oldCharacters, this.isFirstFetch});
}

final class CastFailure extends CastState {
  final String error;
  CastFailure(this.error);
}


final class CastDisplaySuccess extends CastState {
  final List<Character>? characters;
  final String? status;
  final String? search;
  CastDisplaySuccess({this.search,this.characters,this.status});
}