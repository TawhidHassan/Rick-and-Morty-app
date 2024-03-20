part of 'local_cast_bloc.dart';

@immutable
abstract class LocalCastEvent {}
final class LocalCastFetch extends LocalCastEvent {
  final String? status,search;

  LocalCastFetch({this.status, this.search});
}

