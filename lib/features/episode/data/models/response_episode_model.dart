
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/episode/data/models/episodeModel.dart';
import 'package:rick_and_morty/features/home/data/models/character_model.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';
import 'package:rick_and_morty/features/location/data/models/locationModel.dart';

part 'response_episode_model.g.dart';

@JsonSerializable()
class EpisodeResponseModel {

  List<EpisodeModel>? results;
  String?error;

  EpisodeResponseModel({
    this.results,
    this.error
  });



  factory EpisodeResponseModel.fromJson(Map<String, dynamic> json) => _$EpisodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseModelToJson(this);
}