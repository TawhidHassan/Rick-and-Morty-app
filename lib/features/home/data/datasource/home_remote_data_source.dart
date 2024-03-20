import 'dart:io';

import 'package:rick_and_morty/core/config/Strings/api_endpoint.dart';
import 'package:rick_and_morty/features/home/data/models/character_model.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/response_character_model.dart';


abstract interface class HomeRemoteDataSource {
  Future<CharacterResponseModel?> getAllCharacters(String? status,search,int?page);
  Future<CharacterModel?> getcharacterDetails(int?id);
}

///implement
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
   ApiMethod apiMethod;
  HomeRemoteDataSourceImpl(this.apiMethod);


  @override
  Future<CharacterResponseModel?> getAllCharacters(String? status,search,int? page) async{
    // TODO: implement getAllCharacters
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_ALL_CHARACTERS+"?name=${search??""}&status=${status??""}&page=${page??1}",showResult: true,isBasic: true,duration: 30);

      return CharacterResponseModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CharacterModel?> getcharacterDetails(int? id) async{
    // TODO: implement getcharacterDetails
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_CHARACTER_DETAILS+"/${id}",showResult: true,isBasic: true,duration: 30);

      return CharacterModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }
}
