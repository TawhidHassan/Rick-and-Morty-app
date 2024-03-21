// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeResponseModel _$EpisodeResponseModelFromJson(
        Map<String, dynamic> json) =>
    EpisodeResponseModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$EpisodeResponseModelToJson(
        EpisodeResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };
