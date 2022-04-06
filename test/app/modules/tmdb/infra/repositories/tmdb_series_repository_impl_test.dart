import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_series_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_series_repository_impl.dart';


class TmdbSeriesDatasourceMock extends Mock implements ITmdbSeriesDatasource{}

void main() {

  final datasource = TmdbSeriesDatasourceMock();
  final repository = TmdbSeriesRepositoryImpl(datasource);
  final series = TmdbModel(results: []);

  test('Deve retorar um instancia do meu TmdbModel em caso de sucesso', () async {
    when(() => datasource.getSeries()).thenAnswer((_) async => series);
    final result = await repository.getSeries();
    expect(result.fold(id, id), isA<TmdbModel>());
  });
  test('Deve retorar um instancia do meu DatasourceError em caso de falha', () async {
    when(() => datasource.getSeries()).thenThrow(DatasourceError());
    final result = await repository.getSeries();
    expect(result.fold(id, id), isA<DatasourceError>());
  });

}