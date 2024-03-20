part of 'local_bloc.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}


final class CharactersLocalLoading extends LocalState {}

final class CharactersLocalFailure extends LocalState {
  final String error;
  CharactersLocalFailure(this.error);
}
final class HomeLocalCharactersDisplaySuccess extends LocalState {
  final List<CharacterLocal>? characters;
  HomeLocalCharactersDisplaySuccess(this.characters);
}

final class CastSaveSuccess extends LocalState {
  final CharacterLocal? characterLocal;
  CastSaveSuccess({this.characterLocal});
}