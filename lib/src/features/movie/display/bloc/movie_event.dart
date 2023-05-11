part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailRequested extends MovieEvent {
  final int movieId;

  const MovieDetailRequested(this.movieId);

  @override
  List<Object> get props => [movieId];
}
