import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data_layer/models/character.dart';
import 'package:breaking_bad_app/data_layer/repository/characters_repository.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  late List<Character> characters;
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
