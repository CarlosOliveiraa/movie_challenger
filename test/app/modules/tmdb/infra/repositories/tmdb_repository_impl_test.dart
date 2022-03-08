
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_repository_impl.dart';

class TmdbDatasourceMock extends Mock implements ITmdbDatasource {}

void main() {
  final datasource = TmdbDatasourceMock();
  final repository = TmdbRepositoryImpl(datasource);
  final title = TmdbModel(results: []);

  test('Deve retorar o meu TmdbEntity sem erro', () async {
    when(() => datasource.showTitle()).thenAnswer((_) async => title);
    final result = await repository.showTitles();
    expect(result.fold((l) => l, (r) => r), isA<TmdbEntity>());
  });
  test('Deve retorar um DatasourceError', () async {
    when(() => datasource.showTitle()).thenThrow(DatasourceError());
    final result = await repository.showTitles();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
