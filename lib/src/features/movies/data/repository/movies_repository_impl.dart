import 'package:the_movie_db/src/core/network/network_info.dart';
import 'package:the_movie_db/src/features/movies/data/datasource/movies_remote_data_source.dart';
import 'package:the_movie_db/src/features/movies/data/model/movies_response.dart';
import 'package:dartz/dartz.dart';
import 'package:the_movie_db/src/features/movies/domain/repository/movies_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await remoteDataSource.fetchNowPlayingMovies();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await remoteDataSource.fetchPopularMovies();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> getUpcomingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final movies = await remoteDataSource.fetchUpcomingMovies();
        return Right(movies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
