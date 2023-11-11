import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class TrendingMoviesNotifier extends BaseNotifier<MoviesModel> {
  final TrendingMoviesUseCase trendingMovieUsecase;

  TrendingMoviesNotifier({
    required this.trendingMovieUsecase,
  });

  @override
  void onInit() {
    getTrendingMoviesForTheDay();
    getTrendingMoviesForTheWeek();
    super.onInit();
  }

  Future<void> getTrendingMoviesForTheDay() async {
    await _getTrendingMovies('day');
  }

  Future<void> getTrendingMoviesForTheWeek() async {
    await _getTrendingMovies('week');
  }

  Future<void> _getTrendingMovies(String timeWindow) async {
    setLoading();

    state = await trendingMovieUsecase.execute(timeWindow);
    notifyListeners();
  }
}
