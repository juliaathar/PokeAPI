class PokemonModel{
  final String name;
  final String region;
  final List<String> description;

  PokemonModel({required this.name, required this.region, required this.description});

  factory PokemonModel.fromMap(Map<String,dynamic> map){
    return PokemonModel(
      name: map['name'],
      region: map ['region'],
      description: List<String>.from(map(['description'] as List))
    );
  }
}