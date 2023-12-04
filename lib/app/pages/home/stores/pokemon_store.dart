import 'package:flutter/cupertino.dart';
import 'package:poke_api/app/data/models/pokemons_model.dart';

class PokemonStore{
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<PokemonModel>> state = ValueNotifier<List<PokemonModel>>([]);
}