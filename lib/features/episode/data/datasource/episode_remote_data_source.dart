import 'package:rick_and_morty/core/config/Strings/api_endpoint.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/network/api_services.dart';
import '../models/response_episode_model.dart';


abstract interface class EpisodeRemoteDataSource {
  Future<EpisodeResponseModel?> getAllEpisodess(int?page);
}

///implement
class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
   ApiMethod apiMethod;
   EpisodeRemoteDataSourceImpl(this.apiMethod);


  @override
  Future<EpisodeResponseModel?> getAllEpisodess(int? page) async{
    // TODO: implement getAllCharacters
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_ALL_EPISODE+"?page=${page??1}",showResult: true,isBasic: true,duration: 30);
      return EpisodeResponseModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
