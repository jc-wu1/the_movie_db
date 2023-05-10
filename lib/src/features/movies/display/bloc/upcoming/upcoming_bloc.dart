import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_upcoming_movies_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../data/model/movies_response.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc(this.getUpcomingMovies) : super(UpcomingInitial()) {
    on<UpcomingMoviesRequested>(_onUpcomingMoviesRequested);
  }

  final GetUpcomingMoviesUsecase getUpcomingMovies;

  Future<void> _onUpcomingMoviesRequested(
    UpcomingMoviesRequested event,
    Emitter<UpcomingState> emit,
  ) async {
    emit(UpcomingLoadInProgress());
    try {
      final result = await getUpcomingMovies(NoParams());
      result.fold(
        (l) => emit(
          UpcomingLoadFailure(),
        ),
        (r) => emit(
          UpcomingLoadComplete(r.results!),
        ),
      );
    } catch (e) {
      return emit(
        UpcomingLoadFailure(),
      );
    }
  }
}
