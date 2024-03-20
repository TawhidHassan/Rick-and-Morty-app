part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


final class CharactersLoading extends HomeState {}

final class CharactersFailure extends HomeState {
  final String error;
  CharactersFailure(this.error);
}

final class CharactersDisplaySuccess extends HomeState {
  final List<Character>? characters;
  CharactersDisplaySuccess(this.characters);
}
