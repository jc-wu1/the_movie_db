part of 'home_cubit.dart';

enum HomeTab { movies, tvs, profile }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.movies,
  });

  final HomeTab tab;
  @override
  List<Object?> get props => [tab];
}
