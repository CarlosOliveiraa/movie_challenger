import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

class TmdbRepositoryMock extends Mock implements ITmdbRepository {}

void main() {
  final repository = TmdbRepositoryMock();
  final usecase = TmdbUsecase(repository);
  final titles = TmdbEntity(results: []);

  test('Deve retornar a minha TmdbEntity com sucesso', () async {
    when(() => repository.showTitles()).thenAnswer((_) async => Right(titles));
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<TmdbEntity>());
  });
  test('Deve retornar uma Exception<TitleErros> em caso de erro', () async {
    when(() => repository.showTitles()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<TitleErros>());
  });
}
