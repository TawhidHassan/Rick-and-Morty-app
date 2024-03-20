part of 'cast_details_bloc.dart';

@immutable
abstract class CastDetailsEvent {}

final class CastDetailsFetch extends CastDetailsEvent {
  final int? id;
  CastDetailsFetch( {
    this.id,
  });
}


