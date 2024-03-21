
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/features/home/data/models/character_model.dart';
import 'package:rick_and_morty/features/home/domain/entities/character.dart';
import 'package:rick_and_morty/features/location/data/models/locationModel.dart';

part 'response_location_model.g.dart';

@JsonSerializable()
class LocationResponseModel {

  List<LocationModel>? results;
  String?error;

  LocationResponseModel({
    this.results,
    this.error,
  });



  factory LocationResponseModel.fromJson(Map<String, dynamic> json) => _$LocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);
}