import '../models/tmdb_model.dart';

abstract class ITmdbSeriesDatasource {
  Future<TmdbModel> getSeries();
}
