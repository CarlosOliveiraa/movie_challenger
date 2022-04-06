import 'package:dartz/dartz.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_repository.dart';

import '../../errors/tmdb_errors.dart';

abstract class ITmdbUsecase {
  Future<Either<Exception, TmdbEntity>> call();
}

class TmdbUsecase implements ITmdbUsecase {
  final ITmdbRepository repository;

  TmdbUsecase(this.repository);

  @override
  Future<Either<Exception, TmdbEntity>> call() async {
    try {
      final result = await repository.getTitles();
      return result;
    } on TitleErros catch (e) {
      return Left(e);
    }
  }
}
