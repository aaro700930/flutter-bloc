import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(HistoricLocationInitial()) {
    on<HistoricLocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
