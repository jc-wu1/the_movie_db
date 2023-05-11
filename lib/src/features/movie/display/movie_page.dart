import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/src/core/injector.dart';

import '../../../core/constant.dart';
import 'bloc/movie_bloc.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
        sl(),
      )..add(MovieDetailRequested(movieId)),
      child: const MovieView(),
    );
  }
}

class MovieView extends StatelessWidget {
  const MovieView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        title: const Text('Detail'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff161616),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is MovieLoadFailure) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state is MovieLoadComplete) {
            return ListView(
              children: [
                Stack(
                  children: [
                    Image.network(
                      '$detailImgBaseUrl${state.movie.backdropPath!}',
                    ),
                    Positioned(
                      left: 12,
                      top: 10,
                      child: Image.network(
                        '$smallImg${state.movie.posterPath!}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${state.movie.title!} (${state.movie.releaseDate!.year})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'User Score ${state.movie.voteAverage!.toStringAsFixed(2)} / 10',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 4,
                            children: [
                              ...state.movie.genres!.map(
                                (e) => Chip(
                                  label: Text(
                                    e.name!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.movie.overview!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white24,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'User Review',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.separated(
                  itemCount: state.movie.reviews!.results!.take(3).length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        '${state.movie.reviews!.results![index].author} at ${state.movie.reviews!.results![index].createdAt!.toLocal()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${state.movie.reviews!.results![index].content}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
