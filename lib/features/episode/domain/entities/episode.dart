class Episode {
  Episode({
     this.id,
     this.name,
     this.airDate,
     this.episode,
     this.characters,
     this.url,
     this.created,
  });

  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final DateTime? created;


}