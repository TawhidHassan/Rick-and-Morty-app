import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/character.dart';
import '../../../../home/domain/usecase/get_all_characters.dart';

part 'cast_event.dart';
part 'cast_state.dart';


class CastBloc extends Bloc<CastEvent, CastState> {
  final GetAllCharacters _getAllCharacters;
  CastBloc({required GetAllCharacters getAllCharacters}) :_getAllCharacters=getAllCharacters, super(CastInitial()) {
    // on<CastEvent>((event, emit) => emit(CastLoading(isFirstFetch: true,oldCharacters: [])));
    on<CastFetchAll>(_onFetchCastAll);
  }

  int page=1;
  void _onFetchCastAll(
      CastFetchAll event,
      Emitter<CastState> emit) async{

    // if (state is CastLoading) return;

    final currentState = state;
    var oldCharacter = <Character>[];


    if (currentState is CastDisplaySuccess) {
      if(event.status!=currentState.status){
        page=1;
        oldCharacter=[];
      }else if( event.search!=currentState.search){
        page=1;
        oldCharacter=[];
      }
      else{
        oldCharacter=currentState.characters!;
      }



    }
    emit(CastLoading(oldCharacters:  oldCharacter, isFirstFetch: page == 1,));

    ///data call
    final res = await _getAllCharacters(GetCharacterParams(status:event.status,search: event.search,page: page ));

    res.fold(
          (l) => emit(CastFailure(l.message)),
          (r){
        page++;
        if(state is CastLoading){
          final characters = (state as CastLoading).oldCharacters;
          characters?.addAll(r);
          emit(CastDisplaySuccess(characters: characters, status: event.status,search:event.search ));

        }else{
          emit(CastDisplaySuccess(characters: r, status: event.status,search:event.search ));

        }
      },
    );
  }
}

