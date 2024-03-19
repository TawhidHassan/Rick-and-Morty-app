import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/home/domain/usecase/get_all_characters.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/character.dart';

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
    final res = await _getAllCharacters(NoParams());

    // Logger().e(res);

    res.fold(
          (l) => emit(CharactersFailure(l.message)),
          (r) => emit(CharactersDisplaySuccess(r)),
    );
  }
}


