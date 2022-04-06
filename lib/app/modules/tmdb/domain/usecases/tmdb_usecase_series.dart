import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_series_repository.dart';


import '../../errors/tmdb_errors.dart';
import '../entities/tmdb_entity.dart';

abstract class ITmdbUsecaseSeries {
  Future<Either<Exception, TmdbEntity>> call();
}

class TmdbUsecaseSeries implements ITmdbUsecaseSeries{

  final ITmdbSeriesRepository repository;

  TmdbUsecaseSeries(this.repository);

  @override
  Future<Either<Exception, TmdbEntity>> call() async  {
    try {
      final result = await repository.getSeries();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
