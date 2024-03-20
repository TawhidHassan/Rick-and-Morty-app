import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/characterLocal.dart';
import '../../../../home/domain/entities/character.dart';
import '../../../../home/domain/usecase/get_all_characters.dart';
import '../../../../home/domain/usecase/get_all_local_characters.dart';
import '../../../../home/domain/usecase/remove_loacal_character.dart';
import '../../../../home/domain/usecase/save_loacal_character.dart';

part 'local_cast_event.dart';
part 'local_cast_state.dart';

class LocalCastBloc extends Bloc<LocalCastEvent, LocalCastState> {
  final GetAllLocalCharacters _getAllLocalCharacters;
  final SaveLoacalCharacter _saveLoacalCharacter;
  final RemoveLoacalCharacter _removeLoacalCharacter;
  LocalCastBloc({
    required GetAllLocalCharacters getAllLocalCharacters,
    required SaveLoacalCharacter saveLoacalCharacter,
    required RemoveLoacalCharacter removeLoacalCharacter,}) :
        _getAllLocalCharacters=getAllLocalCharacters,
        _saveLoacalCharacter=saveLoacalCharacter,
        _removeLoacalCharacter=removeLoacalCharacter, super(LocalCastInitial()) {
    on<LocalCastEvent>((event, emit) => emit(LocalCastLoading()));
    on<LocalCastFetch>(_onFetchLocalCharactersHome);
  }

  void _onFetchLocalCharactersHome(
      LocalCastFetch event,
      Emitter<LocalCastState> emit,) async{

    final res = await _getAllLocalCharacters(GetCharacterParams(status:event.status,search: event.search,page: 0));
    res.fold(
          (l) => emit(LocalCastFailure(l.message)),
          (r) => emit(LocalCastDisplaySuccess(characters: r,status:event.status ,search: event.search)),
    );
  }
}
