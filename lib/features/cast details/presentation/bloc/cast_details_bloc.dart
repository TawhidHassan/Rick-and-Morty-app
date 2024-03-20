import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/core/local_storage/database_manager.dart';
import 'package:rick_and_morty/features/cast%20details/domain/usecase/get_character_details.dart';
import 'package:rick_and_morty/features/home/domain/usecase/save_loacal_character.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';

import '../../../home/domain/entities/character.dart';

part 'cast_details_event.dart';
part 'cast_details_state.dart';

class CastDetailsBloc extends Bloc<CastDetailsEvent, CastDetailsState> {
  final GetCharacterDetails _getCharacterDetails;

  CastDetailsBloc( {required GetCharacterDetails getCharacterDetails}) :_getCharacterDetails=getCharacterDetails, super(CastDetailsInitial()) {
    on<CastDetailsEvent>((event, emit) => emit(CastDetailsLoading()));
    on<CastDetailsFetch>(_onFetchCastDetails);
  }

  void _onFetchCastDetails(
      CastDetailsFetch event,
      Emitter<CastDetailsState> emit) async{

    ///data call
    final res = await _getCharacterDetails(GetCharacterDeatilsParams(id: event.id ));
    res.fold(
          (l) => emit(CastDetailsFailure(l.message)),
          (r)=>emit(CastDetailsDisplaySuccess(character: r))
    );
  }


}
