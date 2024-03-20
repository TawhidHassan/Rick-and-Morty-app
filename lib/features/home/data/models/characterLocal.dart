import '../../data/models/character_location.dart';

class CharacterLocal {

  final int? id;
  final String? name;
  final String? status;
  final String? image;

//<editor-fold desc="Data Methods">


  const CharacterLocal({
    this.id,
    this.name,
    this.status,
    this.image,
  });

  Map<String, dynamic> toDbMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': this.status,
      'image': this.image,
    };
  }

  factory CharacterLocal.fromDbMap(Map<String, dynamic> map) {
    return CharacterLocal(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      image: map['image'] as String,
    );
  }
}

