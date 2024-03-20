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


  CharacterModel copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    CharacterLocation? origin,
    CharacterLocation? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}

