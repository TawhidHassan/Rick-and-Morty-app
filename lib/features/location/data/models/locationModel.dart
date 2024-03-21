import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

part 'locationModel.g.dart';


@JsonSerializable()
class LocationModel extends Location {
  LocationModel({
     super.id,
    super.name,
    super.type,
    super.dimension,
    super.residents,
    super.url,
    super.created,
  });


  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  LocationModel copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    DateTime? created,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      dimension: dimension ?? this.dimension,
      residents: residents ?? this.residents,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}