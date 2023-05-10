part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoadInProgress extends PopularState {}

class PopularLoadComplete extends PopularState {
  final List<Movie> movies;

  const PopularLoadComplete(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularLoadFailure extends PopularState {}
