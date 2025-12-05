import 'package:breaking_bad_app/data_layer/api/characters_api.dart';
import 'package:breaking_bad_app/data_layer/models/character.dart';

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
