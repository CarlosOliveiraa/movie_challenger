import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_series_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_series_datasource.dart';

import '../../errors/tmdb_errors.dart';

class TmdbSeriesRepositoryImpl implements ITmdbSeriesRepository{

  final ITmdbSeriesDatasource datasource;

  TmdbSeriesRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, TmdbEntity>> getSeries() async {
    try {
      final result = await datasource.getSeries();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}