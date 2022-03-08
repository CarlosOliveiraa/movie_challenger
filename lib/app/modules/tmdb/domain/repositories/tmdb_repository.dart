import 'package:dartz/dartz.dart';

import '../entities/tmdb_entity.dart';

abstract class ITmdbRepository {
  Future<Either<Exception, TmdbEntity>> showTitles();
}
