import 'package:breaking_bad_app/bussiness_logic_layer/cubit/character_cubit.dart';
import 'package:breaking_bad_app/constants/colors.dart';
import 'package:breaking_bad_app/data_layer/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  List<Character> allCharacters = [];
  @override
  void initState() {
    super.initState();
    // allCharacters= BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: const Color(AppColors.primaryColor),
      ),
      body: buildBlocBuilder(),
    );
  }

  BlocBuilder<CharacterCubit, CharacterState> buildBlocBuilder() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterLoaded) {
        allCharacters = state.characters;
        return SingleChildScrollView(
          child: Column(
            children: [
              buildGridView(),
            ],
          ),
        );
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: Color(AppColors.primaryColor),
        ));
      }
    });
  }

  GridView buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: allCharacters.length,
      itemBuilder: buildGridItem,
    );
  }

  Widget? buildGridItem(context, index) {
    final character = allCharacters[index];
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              character.img,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              character.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
