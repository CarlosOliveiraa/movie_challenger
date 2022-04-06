import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/repositories/tmdb_movies_repository.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_movies.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

class TmdbMoviesRepositoryMock extends Mock implements ITmdbMoviesRepository{}

void main() {

  final repository = TmdbMoviesRepositoryMock();
  final usecase = TmdbUsecaseMovies(repository);
  final movies = TmdbEntity(results: []);

  test('Deve retornar uma instancia de TmdbEntity em caso de sucesso', () async {
    when(() => repository.getMovies()).thenAnswer((_) async =>  Right(movies));
    final result = await usecase();
    expect(result.fold(id , id), isA<TmdbEntity>());
  });
  test('Deve retornar uma instancia de TitleErros em caso de falha', () async {
    when(() => repository.getMovies()).thenThrow(TitleErros());
    final result = await usecase();
    expect(result.fold(id , id), isA<TitleErros>());
  });
}