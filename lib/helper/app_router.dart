import 'package:breaking_bad_app/bussiness_logic_layer/cubit/character_cubit.dart';
import 'package:breaking_bad_app/data_layer/api/characters_api.dart';
import 'package:breaking_bad_app/data_layer/repository/characters_repository.dart';
import 'package:breaking_bad_app/presentation_layer/views/character_details_view.dart';
import 'package:breaking_bad_app/presentation_layer/views/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(
      CharactersApi(),
    );
    charactersCubit = CharacterCubit(charactersRepository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'charactersView':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersView(),
          ),
        );
      case 'characterDetailsView':
        return MaterialPageRoute(
          builder: (_) => const CharacterDetailsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
