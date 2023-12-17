part of 'pokemon_bloc.dart';

/*

{
  1: String,
  2: String,
  3: String,
  5: String,
}

*/

class PokemonState extends Equatable {
  final Map<int, String> pokemons;

  const PokemonState({this.pokemons = const {}});

  PokemonState copyWith({Map<int, String>? pokemons}) =>
      PokemonState(pokemons: pokemons ?? this.pokemons);

  @override
  List<Object> get props => [pokemons];
}

// final class PokemonInitial extends PokemonState {}
