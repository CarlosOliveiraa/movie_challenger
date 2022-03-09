import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'presenters/triples/tmdb_store.dart';
import 'presenters/views/tmdb_view.dart';

class TmdbModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => TmdbStore(i())),
    Bind.lazySingleton((i) => TmdbBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const TmdbView()),
  ];
}
