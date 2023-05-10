part of 'now_playing_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoadInProgress extends NowPlayingState {}

class NowPlayingLoadComplete extends NowPlayingState {
  final List<Movie> movies;

  const NowPlayingLoadComplete(this.movies);

  @override
  List<Object> get props => [movies];
}

class NowPlayingLoadFailure extends NowPlayingState {}
