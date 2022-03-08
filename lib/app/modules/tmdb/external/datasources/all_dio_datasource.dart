import 'package:dio/dio.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';

import '../../errors/tmdb_errors.dart';

class AllDioDatasource implements ITmdbDatasource {
  final Dio dio;

  AllDioDatasource(this.dio);

  @override
  Future<TmdbModel> showTitle() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/trending/all/week?api_key=086502878a93b8871eace12f457fa1f1');
      
      return TmdbModel.fromMap(response.data);
    } on DioError catch (e) {
      throw DioDatasourceErro(
        message: "Error: $e",
      );
    }
  }
}
