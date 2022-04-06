import 'package:dartz/dartz.dart';

import '../entities/tmdb_entity.dart';

abstract class ITmdbSeriesRepository {
  Future<Either<Exception, TmdbEntity>> getSeries();
}
