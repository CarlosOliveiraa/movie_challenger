import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_movies_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_movies_datasource.dart';

class TmdbMoviesRepositoryImpl implements ITmdbMoviesRepository {
  final ITmdbMoviesDatasource datasource;

  TmdbMoviesRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, TmdbEntity>> getMovies() async {
    try {
      final result = await datasource.getMovies();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    }
  }
}
