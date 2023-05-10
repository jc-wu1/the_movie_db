import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/core/error/failures.dart';
import 'package:the_movie_db/src/features/movies/data/model/movies_response.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies();
  Future<Either<Failure, MoviesResponse>> getUpcomingMovies();
  Future<Either<Failure, MoviesResponse>> getPopularMovies();
}
