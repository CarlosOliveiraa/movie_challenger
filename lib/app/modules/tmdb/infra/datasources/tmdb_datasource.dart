import '../models/tmdb_model.dart';

abstract class ITmdbDatasource {
  Future<TmdbModel> getTitle();
}
