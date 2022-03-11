import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';

abstract class ITmdbSearchDatasource {
  Future<TmdbModel> searchTitle(String titleText);
}
