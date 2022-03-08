import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_datasource.dart';

import '../../errors/tmdb_errors.dart';

class TmdbRepositoryImpl implements ITmdbRepository {
  final ITmdbDatasource datasource;

  TmdbRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, TmdbEntity>> showTitles() async {
    try {
      final result = await datasource.showTitle();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
