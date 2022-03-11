import 'package:dio/dio.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';

import '../../errors/tmdb_errors.dart';
import '../../infra/datasources/tmdb_search_datasource.dart';

class SearchDioDatasource implements ITmdbSearchDatasource {
  final Dio dio;

  SearchDioDatasource(this.dio);

  @override
  Future<TmdbModel> searchTitle(String titleText) async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/search/multi?api_key=086502878a93b8871eace12f457fa1f1&query=$titleText');

      return TmdbModel.fromMap(response.data);
    } on DioError catch (e) {
      throw DioDatasourceErro(
        message: "Error: $e",
      );
    }
  }
}
