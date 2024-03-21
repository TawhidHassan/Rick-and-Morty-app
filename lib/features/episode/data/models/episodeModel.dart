import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/episode.dart';

part 'episodeModel.g.dart';

@JsonSerializable()
class EpisodeModel extends Episode {
  EpisodeModel({
     required super.id,
    super.name,
    super.airDate,
    super.episode,
    super.characters,
    super.url,
    super.created,
  });


  EpisodeModel copyWith({
    int? id,
    String? name,
    String? airDate,
    String? episode,
    List<String>? characters,
    String? url,
    DateTime? created,
  }) {
    return EpisodeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      airDate: airDate ?? this.airDate,
      episode: episode ?? this.episode,
      characters: characters ?? this.characters,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }


  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}