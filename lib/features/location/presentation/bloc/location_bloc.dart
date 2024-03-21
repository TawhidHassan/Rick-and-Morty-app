import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/usecase/get_all_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetAllLocation _getAllLocation;
  LocationBloc({required GetAllLocation getAllLocation}) :_getAllLocation=getAllLocation, super(LocationInitial()) {
    // on<LocationEvent>((event, emit) => emit(LocationLoading()));
    on<LocationFetchAll>(_onFetchAllLocations);
  }

  int page=1;
  void _onFetchAllLocations(
      LocationFetchAll event,
      Emitter<LocationState> emit,) async{

    final currentState = state;
    var oldLocation = <Location>[];

    if (currentState is LocationDisplaySuccess) {
      oldLocation = currentState.locations!;
    }
    emit(LocationLoading(oldLocations:  oldLocation, isFirstFetch: page == 2,));

    ///data call
    final res = await _getAllLocation(GetLocationParams(page: page));


    res.fold(
          (l) {
            if(l.message=="There is nothing here"){
              final locations= (state as LocationLoading).oldLocations;
              emit(LocationDisplaySuccess(locations: locations ));
            }else{
              emit(LocationFailure(l.message));
            }
          },
          (r) {
            page++;
            if(state is LocationLoading){
              final locations= (state as LocationLoading).oldLocations;
              locations!.addAll(r);
              emit(LocationDisplaySuccess(locations: locations ));
            }else{
              emit(LocationDisplaySuccess(locations: r ));

            }
          },
    );
  }
}
