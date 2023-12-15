part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class SetAllFilterEvent extends GuestsEvent {}

final class SetInvitedFilterEvent extends GuestsEvent {}

final class SetNoInvitedFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter filter;
  const SetCustomFilterEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

final class AddGuestEvent extends GuestsEvent {
  final String description;
  const AddGuestEvent(this.description);

  @override
  List<Object> get props => [description];
}
