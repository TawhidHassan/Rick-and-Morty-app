import 'package:rick_and_morty/core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/response_location_model.dart';


abstract interface class LocationRemoteDataSource {
  Future<LocationResponseModel?> getAllLocationss(int?page);
}

///implement
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
   ApiMethod apiMethod;
   LocationRemoteDataSourceImpl(this.apiMethod);


  @override
  Future<LocationResponseModel?> getAllLocationss(int? page) async{
    // TODO: implement getAllCharacters
    try{
      final result =await apiMethod.get(url: ApiEndpoint.GET_ALL_LOCATION+"?page=${page??1}",showResult: true,isBasic: true,duration: 30);

      return LocationResponseModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
