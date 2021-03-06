import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';

import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';

import 'tmdb_states.dart';

class TmdbStore extends StreamStore<Exception, TmdbSuccess> {
  final ITmdbUsecase usecase;

  TmdbStore(this.usecase) : super(TmdbSuccess(TmdbEntity(results: [])));

  Future<void> getTitle() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(TmdbSuccess(r)));
  }
}
