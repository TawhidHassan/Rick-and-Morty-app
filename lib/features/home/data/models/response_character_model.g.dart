// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CharacterResponseModelToJson(
        CharacterResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };
