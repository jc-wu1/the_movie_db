import 'package:the_movie_db/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/core/usecase/usecase.dart';
import 'package:the_movie_db/src/features/movies/data/model/movies_response.dart';
import 'package:the_movie_db/src/features/movies/domain/repository/movies_repository.dart';

class GetNowPlayingMoviesUsecase extends UseCase<MoviesResponse, NoParams> {
  final MoviesRepository repository;

  GetNowPlayingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, MoviesResponse>> call(
    NoParams params,
  ) async {
    return await repository.getNowPlayingMovies();
  }
}
