import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});
  final String movieId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<SimilarMovieUsecase>();
        return SimilarMoviesNotifier(
          similarMovieUsecase: s,
          movieId: movieId,
        );
      },
      child: Consumer<SimilarMoviesNotifier>(
        builder: (context, similarMovieNotifier, _) {
          return similarMovieNotifier.state.when(
            done: (similarMovies) => GenreCardWidget(
              padding: EdgeInsets.zero,
              title: 'Similar Movies',
              movies: similarMovies.results,
              fontWeight: FontWeight.w700,
            ),
            error: (e) => Text(e ?? ""),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        },
      ),
    );
  }
}
