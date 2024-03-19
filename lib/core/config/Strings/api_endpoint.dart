


import 'package:rick_and_morty/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///production
  static const String googleInterstitialAdAndroid = "ca-app-pub-1180301000500564/2615506114";
  static const String googleRewardAdAndroid = "ca-app-pub-1180301000500564/7477499294";
  static const String googleInterstitialIos = "ca-app-pub-3940256099942544/5224354917";
  static const String googleBannerAds = "ca-app-pub-1180301000500564/9022515259";


  ///Staging
  // static const String googleInterstitialAdAndroid = "ca-app-pub-3940256099942544/1033173712";
  // static const String googleRewardAdAndroid = "ca-app-pub-3940256099942544/5224354917";
  // static const String googleInterstitialIos = "ca-app-pub-3940256099942544/5224354917";
  // static const String googleBannerAds = "ca-app-pub-3940256099942544/6300978111";

  static const String mainDomain = "https://jsonplaceholder.org";
  static const String baseUrl = "$mainDomain/";


//base url of api
//staging
  static  String GET_ALL_PRODUCTS = 'posts'.addBaseURl();

//! auth
  static String categoryUrl = 'app-home-notices'.addBaseURl();
  static String loginURL = '/user/login'.addBaseURl();
  static String logOutURL = '/user/logout'.addBaseURl();
  static String sendOTPEmailURL = '/user/send-code'.addBaseURl();
  static String sendForgotOTPEmailURL = '/user/forget/password'.addBaseURl();

}
