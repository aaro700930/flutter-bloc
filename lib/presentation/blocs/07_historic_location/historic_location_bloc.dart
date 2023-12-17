import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocationEvent>(_onNewLocationHandler);
  }

  void onNewUserLocationCallback((double lat, double lng) location) {
    add(NewLocationEvent(location));
    print(state.locations.length);
  }

  void _onNewLocationHandler(
    NewLocationEvent event,
    Emitter<HistoricLocationState> emit,
  ) {
    emit(state.copyWith(
      locations: [...state.locations, event.location],
    ));
  }
}
