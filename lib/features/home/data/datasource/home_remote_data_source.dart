import 'dart:io';

import 'package:rick_and_morty/core/config/Strings/api_endpoint.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/response_character_model.dart';


abstract interface class HomeRemoteDataSource {
  Future<CharacterResponseModel?> getAllCharacters();
}

///implement
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
   ApiMethod apiMethod;
  HomeRemoteDataSourceImpl(this.apiMethod);

  // @override
  // Future<List<BlogModel>> getAllBlogs() async {
  //   try {
  //     final blogs =
  //         await supabaseClient.from('blogs').select('*, profiles (name)');
  //     return blogs
  //         .map(
  //           (blog) => BlogModel.fromJson(blog).copyWith(
  //             posterName: blog['profiles']['name'],
  //           ),
  //         )
  //         .toList();
  //   } on PostgrestException catch (e) {
  //     throw ServerException(e.message);
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  @override
  Future<CharacterResponseModel?> getAllCharacters() async{
    // TODO: implement getAllCharacters
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_ALL_CHARACTERS,showResult: true,isBasic: true,duration: 30);

      return CharacterResponseModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }
}
