import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class DiscoverMoviesUsecase {
  final SearchMoviesRepository searchMoviesRepo;
  DiscoverMoviesUsecase({
    required this.searchMoviesRepo,
  });

  Future<NotifierState<MoviesModel>> execute({required int page}) async {
    return await searchMoviesRepo.discoverMovies(page);
  }
}