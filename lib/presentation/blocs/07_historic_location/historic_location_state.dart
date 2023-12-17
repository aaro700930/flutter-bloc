part of 'historic_location_bloc.dart';

class HistoricLocationState extends Equatable {
  final List<(double lat, double lng)> locations;

  const HistoricLocationState({this.locations = const []});

  HistoricLocationState copyWith({
    List<(double lat, double lng)>? locations,
  }) {
    return HistoricLocationState(
      locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [locations];
}
