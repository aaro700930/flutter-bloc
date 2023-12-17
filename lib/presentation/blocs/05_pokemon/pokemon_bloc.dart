import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int) fetchPokemonName,
  })  : _fetchPokemonName = fetchPokemonName,
        super(const PokemonState()) {
    on<PokemonAddEvent>((event, emit) {
      // state.pokemons[event.pokemonId] = event.pokemonName;
      // emit(state.copyWith());
      final newPokemons = {...state.pokemons};
      newPokemons[event.pokemonId] = event.pokemonName;

      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemon(int pokemonId) async {
    if (state.pokemons.containsKey(pokemonId)) {
      return state.pokemons[pokemonId]!;
    }

    try {
      final pokemonName = await _fetchPokemonName(pokemonId);
      add(PokemonAddEvent(pokemonId, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon: $e');
    }
  }
}
