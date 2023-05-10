import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/src/core/usecase/usecase.dart';
import 'package:the_movie_db/src/features/movies/data/model/movies_response.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_now_playing_movies_usecase.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc(this.getNowPlayingMovies) : super(NowPlayingInitial()) {
    on<NowPlayingMoviesRequested>(_onNowPlayingMoviesRequested);
  }

  final GetNowPlayingMoviesUsecase getNowPlayingMovies;

  Future<void> _onNowPlayingMoviesRequested(
    NowPlayingMoviesRequested event,
    Emitter<NowPlayingState> emit,
  ) async {
    emit(NowPlayingLoadInProgress());
    try {
      final result = await getNowPlayingMovies(NoParams());
      result.fold(
        (l) => emit(
          NowPlayingLoadFailure(),
        ),
        (r) => emit(
          NowPlayingLoadComplete(r.results!),
        ),
      );
    } catch (e) {
      return emit(
        NowPlayingLoadFailure(),
      );
    }
  }
}
