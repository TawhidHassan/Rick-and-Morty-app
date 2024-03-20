part of 'local_cast_bloc.dart';

@immutable
abstract class LocalCastState {}

class LocalCastInitial extends LocalCastState {}


final class LocalCastLoading extends LocalCastState {}

final class LocalCastFailure extends LocalCastState {
  final String error;
  LocalCastFailure(this.error);
}

final class LocalCastDisplaySuccess extends LocalCastState {
  final List<CharacterLocal>? characters;
  final String? status;
  final String? search;
  LocalCastDisplaySuccess({this.characters, this.status, this.search});
}

