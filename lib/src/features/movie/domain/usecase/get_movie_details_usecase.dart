import 'package:the_movie_db/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/core/usecase/usecase.dart';
import 'package:the_movie_db/src/features/movie/data/model/movie_detail_response.dart';
import 'package:the_movie_db/src/features/movie/domain/repository/movie_repository.dart';

class GetMovieDetailsUsecase extends UseCase<MovieDetailResponse, int> {
  final MovieRepository repository;

  GetMovieDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, MovieDetailResponse>> call(
    int params,
  ) async {
    return await repository.getMovieDetails(params);
  }
}
