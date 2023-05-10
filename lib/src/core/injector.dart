import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_db/src/core/network/dio.dart';
import 'package:the_movie_db/src/features/movies/data/datasource/movies_remote_data_source.dart';
import 'package:the_movie_db/src/features/movies/data/repository/movies_repository_impl.dart';
import 'package:the_movie_db/src/features/movies/domain/repository/movies_repository.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_upcoming_movies_usecase.dart';

import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(getDio());

  sl.registerSingleton<NetworkInfo>(
    const NetworkInfoImpl(),
  );

  sl.registerSingleton<MoviesRemoteDataSource>(
    MoviesRemoteDataSource(sl()),
  );

  // REPO
  sl.registerSingleton<MoviesRepository>(
    MoviesRepositoryImpl(
      sl<MoviesRemoteDataSource>(),
      sl<NetworkInfo>(),
    ),
  );

  // USECASE
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(
    GetNowPlayingMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );
  sl.registerSingleton<GetPopularMoviesUsecase>(
    GetPopularMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );
  sl.registerSingleton<GetUpcomingMoviesUsecase>(
    GetUpcomingMoviesUsecase(
      sl<MoviesRepository>(),
    ),
  );
}
