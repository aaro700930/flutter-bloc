import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:blocs_app/config/config.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<PokemonAddEvent>((event, emit) {
      state.pokemons[event.pokemonId] = event.pokemonName;
      emit(state.copyWith());
      // final newPokemons = {...state.pokemons};
      // newPokemons[event.pokemonId] = event.pokemonName;

      // emit(state.copyWith(pokemons: newPokemons));
    });
    // on<PokemonEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  Future<String> fetchPokemon(int pokemonId) async {
    try {
      final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
      add(PokemonAddEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon: $e');
    }
  }
}
