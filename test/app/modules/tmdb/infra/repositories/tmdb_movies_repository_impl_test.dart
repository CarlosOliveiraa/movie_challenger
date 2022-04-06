import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/datasources/tmdb_movies_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_movies_repository_impl.dart';

class TmdbMoviesDatasourceMock extends Mock implements ITmdbMoviesDatasource{}

void main() {

  final datasource = TmdbMoviesDatasourceMock();
  final repository = TmdbMoviesRepositoryImpl(datasource);
  final movies = TmdbModel(results: []);

  test('Deve retornar uma instancia do meu TmdbModel em caso de sucesso', () async {
    when(() => datasource.getMovies()).thenAnswer((_) async => movies);
    final result =  await repository.getMovies();
    expect(result.fold(id, id), isA<TmdbModel>());
  });
  test('Deve retornar uma instancia do meu DatasourceError em caso de falha', () async {
    when(() => datasource.getMovies()).thenThrow(DatasourceError());
    final result =  await repository.getMovies();
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}