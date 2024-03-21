class Location {
  Location({
     this.id,
     this.name,
     this.type,
     this.dimension,
     this.residents,
     this.url,
     this.created,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final DateTime? created;

}