// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseModel _$LocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$LocationResponseModelToJson(
        LocationResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };
