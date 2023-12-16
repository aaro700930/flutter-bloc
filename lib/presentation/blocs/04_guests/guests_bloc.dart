import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.filter));
    });
    on<AddGuestEvent>(_addGuestHandler);
    on<ToggleGuestEvent>(_toggleGuestHandler);
  }

  void changeFilter(GuestFilter filter) {
    add(SetCustomFilterEvent(filter));
    // switch (filter) {
    //   case GuestFilter.all:
    //     add(SetAllFilterEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterEvent());
    //     break;
    //   case GuestFilter.unconfirmed:
    //     add(SetNoInvitedFilterEvent());
    //     break;
    // }
  }

  void addGuest(String description) {
    add(AddGuestEvent(description));
  }

  void _addGuestHandler(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: event.description,
      completedAt: null,
    );
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
          completedAt: guest.completedAt == null ? DateTime.now() : null,
        );
      }
      return guest;
    }).toList();
    emit(state.copyWith(guests: newGuests));
  }

  void toggleGuest(String id) {
    add(ToggleGuestEvent(id));
  }
}
