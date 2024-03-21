import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/exceptions.dart';
import 'package:rick_and_morty/core/error/failures.dart';
import 'package:rick_and_morty/features/home/data/models/characterLocal.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_local_data_source.dart';
import '../datasource/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  final ConnectionChecker connectionChecker;
  HomeRepositoryImpl(
    this.homeRemoteDataSource,
    this.connectionChecker,
      this.homeLocalDataSource,
  );

  @override
  Future<Either<Failure, List<Character>>> getAllcharacters(String? status,search,int?page)async {
    // TODO: implement getAllcharacters
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final characters = await homeRemoteDataSource.getAllCharacters(status,search,page);
        if(characters!.results==null){
          return left(Failure(characters.error!));
        }else{
          return right(characters.results!);
        }
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Character>> getcharacterDetails(int? id) async{
    // TODO: implement getcharacterDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final characters = await homeRemoteDataSource.getcharacterDetails(id);
        return right(characters!);
      }
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<CharacterLocal>>> getLocalAllcharacters(String? status, search) async{
    try{
      final characters = await homeLocalDataSource.loadCharacters(search: search,status: status);
      return right(characters);
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CharacterLocal>> uploadLocaldata(CharacterLocal characterLocal)async {
    // TODO: implement uploadLocaldata
    try{
        final characters = await homeLocalDataSource.uploadLocalCharacters( characterLocal: characterLocal);
        return right(characters!);
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CharacterLocal>> removeLocaldata(int id)async {
    // TODO: implement removeLocaldata
    try{
      final characters = await homeLocalDataSource.removeLocalCharacters( id: id);
      return right(characters!);
    }on ServerException catch (e){
      return left(Failure(e.message));
    }
  }



}
