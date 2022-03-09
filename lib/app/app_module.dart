import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';
import 'package:movie_challenger/app/modules/tmdb/external/datasources/all_dio_datasource.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/repositories/tmdb_repository_impl.dart';

import 'modules/tmdb/presenters/triples/tmdb_store.dart';
import 'modules/tmdb/tmdb_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => AllDioDatasource(i())),
    Bind((i) => TmdbRepositoryImpl(i())),
    Bind((i) => TmdbUsecase(i())),
    Bind((i) => TmdbStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: TmdbModule()),
  ];
}
