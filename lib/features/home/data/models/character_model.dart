import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/character.dart';
import 'character_location.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends Character {
  CharacterModel({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.origin,
    super.location,
    super.image,
    super.episode,
    super.url,
    super.created,
});





  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  // UserModel copyWith({
  //   String? id,
  //   String? email,
  //   String? name,
  // }) {
  //   return UserModel(
  //     id: id ?? this.id,
  //     email: email ?? this.email,
  //     name: name ?? this.name,
  //   );
  // }
}

