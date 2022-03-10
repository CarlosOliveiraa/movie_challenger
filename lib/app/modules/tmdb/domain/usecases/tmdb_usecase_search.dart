import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_search_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

abstract class ITmdbUsecaseSearch {
  Future<Either<Exception, TmdbEntity>> call(String titleText);
}

class TmdbUsecaseSearch implements ITmdbUsecaseSearch {
  final ITmdbSearchRepository repository;

  TmdbUsecaseSearch(this.repository);

  @override
  Future<Either<Exception, TmdbEntity>> call(String titleText) async {
    final result = await repository.searchTitle(titleText);
    if (titleText.isEmpty) {
      return Left(SearchError());
    }
    return result;
  }
}
