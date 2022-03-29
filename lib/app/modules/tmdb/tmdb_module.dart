import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/search/tmdb_search_store.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/search_view.dart';
import 'domain/usecases/tmdb_usecase.dart';
import 'domain/usecases/tmdb_usecase_search.dart';
import 'external/datasources/all_dio_datasource.dart';
import 'external/datasources/search_dio_datasource.dart';
import 'infra/repositories/tmdb_repository_impl.dart';
import 'infra/repositories/tmdb_search_repository_impl.dart';
import 'presenters/triples/tmdb_store.dart';
import 'presenters/views/tmdb_view.dart';

class TmdbModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => TmdbSearchStore(i())),
    Bind((i) => Dio()),
    Bind((i) => AllDioDatasource(i())),
    Bind((i) => TmdbRepositoryImpl(i())),
    Bind((i) => TmdbUsecase(i())),
    Bind((i) => SearchDioDatasource(i())),
    Bind((i) => TmdbSearchRepositoryImpl(i())),
    Bind((i) => TmdbUsecaseSearch(i())),
    Bind((i) => TmdbStore(i())),
    Bind((i) => TmdbBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const TmdbView()),
    ChildRoute('/searchView', child: (_, args) => const SearchView()),
  ];
}
