import 'package:flutter_bloc/data_layer/api/characters_api.dart';
import 'package:flutter_bloc/data_layer/models/character.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<Character>> getAllCharacters() async {
    final charactersResponse = await charactersApi.getAllCharacters();
    return charactersResponse
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
