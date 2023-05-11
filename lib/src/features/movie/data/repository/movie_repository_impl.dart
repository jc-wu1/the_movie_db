import 'package:the_movie_db/src/core/network/network_info.dart';
import 'package:the_movie_db/src/features/movie/data/datasource/movie_remote_data_source.dart';
import 'package:the_movie_db/src/features/movie/data/model/movie_detail_response.dart';
import 'package:the_movie_db/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/features/movie/domain/repository/movie_repository.dart';

import '../../../../core/error/exceptions.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, MovieDetailResponse>> getMovieDetails(
    int movieId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final movie = await remoteDataSource.fetchMovieDetails(movieId);
        return Right(movie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
