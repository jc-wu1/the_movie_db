import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/src/features/movie/data/model/movie_detail_response.dart';
import 'package:the_movie_db/src/features/movie/domain/usecase/get_movie_details_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this.getMovieDetails) : super(MovieInitial()) {
    on<MovieDetailRequested>(_onMovieDetailRequested);
  }

  final GetMovieDetailsUsecase getMovieDetails;

  Future<void> _onMovieDetailRequested(
    MovieDetailRequested event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoadInProgress());
    try {
      final result = await getMovieDetails(event.movieId);
      result.fold(
        (l) => emit(MovieLoadFailure()),
        (r) => emit(MovieLoadComplete(r)),
      );
    } catch (e) {
      emit(MovieLoadFailure());
    }
  }
}
