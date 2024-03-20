


import 'package:rick_and_morty/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///production
  static const String mainDomain = "https://rickandmortyapi.com";
  static const String baseUrl = "$mainDomain/api/";


//base url of api
//staging
  static  String GET_ALL_CHARACTERS = 'character'.addBaseURl();
  static  String GET_CHARACTER_DETAILS = 'character'.addBaseURl();

//! auth
  static String categoryUrl = 'app-home-notices'.addBaseURl();


}
