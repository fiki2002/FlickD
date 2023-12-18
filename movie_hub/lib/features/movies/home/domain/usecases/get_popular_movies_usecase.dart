import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class PopularMoviesUsecase implements UseCaseFuture<Failure, MoviesModel, int> {
  final HomeRepository homeRepository;
  PopularMoviesUsecase({
    required this.homeRepository,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> call(int params) async {
    return await homeRepository.getPopularMovies(params);
  }
}
