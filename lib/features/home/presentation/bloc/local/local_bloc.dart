import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/remove_loacal_character.dart';
import '../../../domain/usecase/save_loacal_character.dart';
import '../../../data/models/characterLocal.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecase/get_all_characters.dart';
import '../../../domain/usecase/get_all_local_characters.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocalBloc extends Bloc<LocalEvent, LocalState> {
  final GetAllLocalCharacters _getAllLocalCharacters;
  final SaveLoacalCharacter _saveLoacalCharacter;
  final RemoveLoacalCharacter _removeLoacalCharacter;
  LocalBloc({
    required GetAllLocalCharacters getAllLocalCharacters,
    required SaveLoacalCharacter saveLoacalCharacter,
    required RemoveLoacalCharacter removeLoacalCharacter,
  }) : _getAllLocalCharacters=getAllLocalCharacters,
        _saveLoacalCharacter=saveLoacalCharacter,
        _removeLoacalCharacter=removeLoacalCharacter,
        super(LocalInitial()) {
    on<LocalEvent>((event, emit) => emit(CharactersLocalLoading()));
    on<CharacetersFetchHome>(_onFetchLocalCharactersHome);
    on<SaveCharacter>(_onSaveCharacterLoacl);
    on<RemoveCharacter>(_onRemoveCharacterLoacl);
  }

  void _onFetchLocalCharactersHome(
      CharacetersFetchHome event,
      Emitter<LocalState> emit,) async{
    final res = await _getAllLocalCharacters(GetCharacterParams(status:'',search: ''));
    res.fold(
          (l) => emit(CharactersLocalFailure(l.message)),
          (r) => emit(HomeLocalCharactersDisplaySuccess(r)),
    );
  }

  void _onSaveCharacterLoacl(
      SaveCharacter event,
      Emitter<LocalState> emit) async{
    ///data call
    final res = await _saveLoacalCharacter(SaveCharacterParams(characterLocal: CharacterLocal(
      id: event.character!.id,
      status:event.character!.status,
      image: event.character!.image,
      name:event.character!.name,
    ) ));
    res.fold(
            (l) => emit(CharactersLocalFailure(l.message)),
            (r)=>emit(CastSaveSuccess(characterLocal: r))
    );
  }

  void _onRemoveCharacterLoacl(
      RemoveCharacter event,
      Emitter<LocalState> emit) async{
    ///data call
    final res = await _removeLoacalCharacter(RemoveCharacterParams(id:event.id));
    print("object");
    res.fold(
            (l) => emit(CharactersLocalFailure(l.message)),
            (r)=>emit(CastSaveSuccess(characterLocal: r))
    );
  }
}
