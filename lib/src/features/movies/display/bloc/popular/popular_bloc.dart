import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_popular_movies_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../data/model/movies_response.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc(this.getPopularMovies) : super(PopularInitial()) {
    on<PopularMoviesRequested>(_onPopularMoviesRequested);
  }

  final GetPopularMoviesUsecase getPopularMovies;

  Future<void> _onPopularMoviesRequested(
    PopularMoviesRequested event,
    Emitter<PopularState> emit,
  ) async {
    emit(PopularLoadInProgress());
    try {
      final result = await getPopularMovies(NoParams());
      result.fold(
        (l) => emit(
          PopularLoadFailure(),
        ),
        (r) => emit(
          PopularLoadComplete(r.results!),
        ),
      );
    } catch (e) {
      return emit(
        PopularLoadFailure(),
      );
    }
  }
}
