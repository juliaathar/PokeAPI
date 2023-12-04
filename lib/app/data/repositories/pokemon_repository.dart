import 'dart:convert';

import 'package:poke_api/app/data/http/exceptions.dart';
import 'package:poke_api/app/data/http/http_client.dart';
import 'package:poke_api/app/data/models/pokemons_model.dart';

abstract class IPokemonRepository{
  Future<List<PokemonModel>>getPokemon();
}

class PokemonRepository implements IPokemonRepository{
  final IHttpCliente client;
  PokemonRepository({required this.client});

  @override
  Future<List<PokemonModel>> getPokemon() async {
    final response = await client.get(
        url: 'https://pokeapi.co/api/v2/pokemon/');

    if (response.statusCode == 200) {
      final List<PokemonModel> pokemons = [];

      final body = jsonDecode(response.body);

      body['results'].map((item) {
        final PokemonModel pokemon = PokemonModel.fromMap(item);
        pokemons.add(pokemon);
      }).toList();
      return pokemons;
    } else if (response.statusCode == 404) {
      throw NotFoundException('Url não é válida');
    } else {
      throw NotFoundException('Error');
    }
  }}