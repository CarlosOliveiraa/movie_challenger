import '../models/tmdb_model.dart';

abstract class ITmdbMoviesDatasource {
  Future<TmdbModel> getMovies();
}
