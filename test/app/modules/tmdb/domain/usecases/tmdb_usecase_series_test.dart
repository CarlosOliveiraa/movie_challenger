import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_series_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_series.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

class TmdbSeriesRepositoryMock extends Mock implements ITmdbSeriesRepository {}

void main() {
  final repository = TmdbSeriesRepositoryMock();
  final usecase = TmdbUsecaseSeries(repository);
  final series = TmdbEntity(results: []);

  test('Deve retornar a minha entidade', () async {
    when(() => repository.getSeries()).thenAnswer((_) async => Right(series));
    final result = await usecase();
    expect(result.fold(id, id), isA<TmdbEntity>());
  });
  test('Deve retornar uma instancia de TitleErros em caso de falha', () async {
    when(() => repository.getSeries()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold(id, id), isA<TitleErros>());
  });
}
