import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_search_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_search.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

class TmdbSearchRepositoryMock extends Mock implements ITmdbSearchRepository {}

void main() {
  final repository = TmdbSearchRepositoryMock();
  final usecase = TmdbUsecaseSearch(repository);
  final titles = TmdbEntity(results: []);

  test('Deve retornar minha TmdbEntity com sucesso', () async {
    when(() => repository.searchTitle(any()))
        .thenAnswer((_) async => Right(titles));
    final result = await usecase("carlos");
    expect(result.fold(id, id), isA<TmdbEntity>());
  });
  test('Deve retornar um SearchError em casso de erro', () async {
    when(() => repository.searchTitle(any()))
        .thenAnswer((_) async => Right(titles));
    final result = await usecase("");
    expect(result.fold((l) => l, (r) => r), isA<SearchError>());
  });
}
