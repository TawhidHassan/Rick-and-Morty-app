part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}


final class LocationLoading extends LocationState {
  final List<Location>? oldLocations;
  final bool? isFirstFetch;

  LocationLoading({this.oldLocations, this.isFirstFetch});
}

final class LocationFailure extends LocationState {
  final String error;
  LocationFailure(this.error);
}

final class LocationDisplaySuccess extends LocationState {
  final List<Location>? locations;
  LocationDisplaySuccess({this.locations});
}
