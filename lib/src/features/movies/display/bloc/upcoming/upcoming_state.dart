part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoadInProgress extends UpcomingState {}

class UpcomingLoadComplete extends UpcomingState {
  final List<Movie> movies;

  const UpcomingLoadComplete(this.movies);

  @override
  List<Object> get props => [movies];
}

class UpcomingLoadFailure extends UpcomingState {}
