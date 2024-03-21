
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/home/data/models/character_model.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';

part 'response_character_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {

  List<CharacterModel>? results;
  String?error;
  CharacterResponseModel({
    this.results,
    this.error,
  });



  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) => _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);
}