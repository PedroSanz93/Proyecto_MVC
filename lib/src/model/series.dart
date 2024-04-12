class RickAndMortyCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  RickAndMortyCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory RickAndMortyCharacter.fromJson(Map<String, dynamic> json) {
    return RickAndMortyCharacter(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      episode: List<String>.from(json['episode'] as List),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }
}