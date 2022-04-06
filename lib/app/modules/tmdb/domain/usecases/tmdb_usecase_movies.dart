import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_movies_repository.dart';

import '../../errors/tmdb_errors.dart';
import '../entities/tmdb_entity.dart';

abstract class ITmdbUsecaseMovies {
  Future<Either<Exception, TmdbEntity>> call();
}

class TmdbUsecaseMovies implements ITmdbUsecaseMovies {
  final ITmdbMoviesRepository repository;

  TmdbUsecaseMovies(this.repository);

  @override
  Future<Either<Exception, TmdbEntity>> call() async {
    try {
      final result = repository.getMovies();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
