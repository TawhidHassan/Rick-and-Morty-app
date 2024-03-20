part of 'cast_details_bloc.dart';

@immutable
abstract class CastDetailsState {}

class CastDetailsInitial extends CastDetailsState {}

final class CastDetailsLoading extends CastDetailsState {}

final class CastDetailsFailure extends CastDetailsState {
  final String error;
  CastDetailsFailure(this.error);
}

final class CastDetailsDisplaySuccess extends CastDetailsState {
  final Character? character;
  CastDetailsDisplaySuccess({this.character});
}

