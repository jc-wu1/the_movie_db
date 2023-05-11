part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoadInProgress extends MovieState {}

class MovieLoadComplete extends MovieState {
  final MovieDetailResponse movie;

  const MovieLoadComplete(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieLoadFailure extends MovieState {}
