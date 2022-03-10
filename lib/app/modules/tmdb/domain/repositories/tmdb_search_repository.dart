import 'package:dartz/dartz.dart';

import '../entities/tmdb_entity.dart';

abstract class ITmdbSearchRepository {
  Future<Either<Exception, TmdbEntity>> searchTitle(String titleText);
}
