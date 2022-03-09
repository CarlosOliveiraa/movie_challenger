import 'package:flutter_triple/flutter_triple.dart';


import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';
import 'package:movie_challenger/app/modules/tmdb/infra/models/tmdb_model.dart';

import 'tmdb_states.dart';

class TmdbStore extends StreamStore<Error, TmdbSuccess> {
  final ITmdbUsecase usecase;

  TmdbStore(this.usecase) : super(TmdbSuccess(TmdbModel(results: [])));

  Future<void> showTitle() async {
    setLoading(true);
    try {
      final result = await usecase();
      result.fold((l) => Error, (r) => update(TmdbSuccess(TmdbModel(results: r.results))));
    } catch (e) {
      setError(Error());
    } finally {
      setLoading(false);
    }
  }
}
