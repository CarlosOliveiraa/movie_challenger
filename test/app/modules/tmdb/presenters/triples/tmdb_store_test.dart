import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/tmdb_store.dart';
import 'package:triple_test/triple_test.dart';

class TmdbUsecaseMock extends Mock implements ITmdbUsecase{}

void main() {
  
  final usecase = TmdbUsecaseMock();
  final titles = TmdbEntity(results: []);

  storeTest<TmdbStore>("Deve atualizar o estado em caso de sucesso", build: ()  {
      when(() => usecase.call()).thenAnswer((_) async => Right(titles));
      return TmdbStore(usecase);
  },
  act: (store) =>  store.getTitle(),
  expect: () => [
    tripleLoading,
    tripleState,
  ]);
  storeTest<TmdbStore>("Deve apresentar um erro", build: ()  {
      when(() => usecase.call()).thenAnswer((_) async => Left(Exception()));
      return TmdbStore(usecase);
  },
  act: (store) =>  store.getTitle(),
  expect: () => [
    tripleLoading,
    tripleError,
    tripleLoading,
  ]);
}