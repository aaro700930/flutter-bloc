part of 'guests_bloc.dart';

enum GuestFilter { all, invited, unconfirmed }

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) {
    return GuestsState(
      filter: filter ?? this.filter,
      guests: guests ?? this.guests,
    );
  }

  int get howMany => guests.length;

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestFilter.all:
        return guests;
      case GuestFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestFilter.unconfirmed:
        return guests.where((guest) => !guest.done).toList();
      default:
        throw Exception('Unknown filter: $filter');
    }
  }

  int get filteredHowMany => filteredGuests.length;

  @override
  List<Object> get props => [filter, guests];
}
