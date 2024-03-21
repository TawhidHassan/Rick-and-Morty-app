import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/character.dart';
import '../../../domain/usecase/get_all_characters.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCharacters _getAllCharacters;

  HomeBloc({required GetAllCharacters getAllCharacters}) : _getAllCharacters = getAllCharacters, super(HomeInitial()) {
    on<HomeEvent>((event, emit) => emit(CharactersLoading()));
    on<CharacetersFetchAll>(_onFetchAllCharacters);

  }




  void _onFetchAllCharacters(
      CharacetersFetchAll event,
      Emitter<HomeState> emit,) async{
    final res = await _getAllCharacters(GetCharacterParams(status:''));

    // Logger().e(res);

    res.fold(
          (l) => emit(CharactersFailure(l.message)),
          (r) => emit(CharactersDisplaySuccess(r)),
    );
  }

}