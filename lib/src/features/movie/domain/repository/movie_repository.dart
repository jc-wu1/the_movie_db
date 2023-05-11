import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/core/error/failures.dart';
import 'package:the_movie_db/src/features/movie/data/model/movie_detail_response.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieDetailResponse>> getMovieDetails(int movieId);
}
