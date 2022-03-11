import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_search_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_search_datasource.dart';

class TmdbSearchRepositoryImpl implements ITmdbSearchRepository{

  final ITmdbSearchDatasource datasource;

  TmdbSearchRepositoryImpl(this.datasource);


  @override
  Future<Either<Exception, TmdbEntity>> searchTitle(String titleText) async {
   try {
      final result = await datasource.searchTitle(titleText);
      return Right(result);
   } on DatasourceError catch (e) {
     return Left(e);
   }
  }
}