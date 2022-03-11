import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_search_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_search_repository_impl.dart';

class TmdbSearchDatasourceMock extends Mock implements ITmdbSearchDatasource {}

void main() {
  final datasource = TmdbSearchDatasourceMock();
  final repository = TmdbSearchRepositoryImpl(datasource);
  final titles = TmdbModel(results: []);
  test('Deve retornar o meu TmdbEntity sem erro', () async {
    when(() => datasource.searchTitle(any())).thenAnswer((_) async => titles);
    final result = await repository.searchTitle("Arrow");
    expect(result.fold(id, id), isA<TmdbEntity>());
  });
  test('Deve retornar um DatasourceError', () async {
    when(() => datasource.searchTitle(any())).thenThrow(DatasourceError());
    final result = await repository.searchTitle("");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
