part of 'cast_bloc.dart';


@immutable
abstract class CastEvent {}
final class CastFetchAll extends CastEvent {
  final String? status;
  final String? search;
  CastFetchAll( {
    this.status,
    this.search,
  });
}