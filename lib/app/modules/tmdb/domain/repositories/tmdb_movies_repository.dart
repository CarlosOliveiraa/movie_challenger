import 'package:dartz/dartz.dart';

import '../entities/tmdb_entity.dart';

abstract class ITmdbMoviesRepository {
  Future<Either<Exception, TmdbEntity>> getMovies();
}
