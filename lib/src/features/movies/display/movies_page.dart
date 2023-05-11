import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/src/core/injector.dart';
import 'package:the_movie_db/src/features/movie/display/movie_page.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:the_movie_db/src/features/movies/domain/usecase/get_upcoming_movies_usecase.dart';

import '../../../core/constant.dart';
import '../domain/usecase/get_now_playing_movies_usecase.dart';
import 'bloc/blocs.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingBloc(
            sl<GetNowPlayingMoviesUsecase>(),
          )..add(
              const NowPlayingMoviesRequested(),
            ),
        ),
        BlocProvider(
          create: (context) => UpcomingBloc(
            sl<GetUpcomingMoviesUsecase>(),
          )..add(
              const UpcomingMoviesRequested(),
            ),
        ),
        BlocProvider(
          create: (context) => PopularBloc(
            sl<GetPopularMoviesUsecase>(),
          )..add(
              const PopularMoviesRequested(),
            ),
        ),
      ],
      child: const MoviesView(),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            BlocBuilder<PopularBloc, PopularState>(
              builder: (context, state) {
                if (state is PopularLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is PopularLoadComplete) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieContainer(
                          movieId: state.movies[index].id!,
                          posterUrl:
                              '$imgBaseUrl${state.movies[index].posterPath}',
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Now Playing',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            BlocBuilder<NowPlayingBloc, NowPlayingState>(
              builder: (context, state) {
                if (state is NowPlayingLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is NowPlayingLoadComplete) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieContainer(
                          movieId: state.movies[index].id!,
                          posterUrl:
                              '$imgBaseUrl${state.movies[index].posterPath}',
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Upcoming',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            BlocBuilder<UpcomingBloc, UpcomingState>(
              builder: (context, state) {
                if (state is UpcomingLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is UpcomingLoadComplete) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieContainer(
                          movieId: state.movies[index].id!,
                          posterUrl:
                              '$imgBaseUrl${state.movies[index].posterPath}',
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    super.key,
    required this.movieId,
    required this.posterUrl,
  });

  final int movieId;
  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MoviePage(
                movieId: movieId,
              ),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.network(
            posterUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
