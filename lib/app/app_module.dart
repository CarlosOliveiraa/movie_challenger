// import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';
// import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_search.dart';
// import 'package:movie_challenger/app/modules/tmdb/external/datasources/all_dio_datasource.dart';
// import 'package:movie_challenger/app/modules/tmdb/external/datasources/search_dio_datasource.dart';
// import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_repository_impl.dart';
// import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_search_repository_impl.dart';
// import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
// import 'modules/tmdb/presenters/triples/tmdb_store.dart';
import 'modules/tmdb/tmdb_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: TmdbModule(),
    ),
  ];
}
