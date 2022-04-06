import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_series.dart';

import '../tmdb_states.dart';

class TmdbSeriesStore extends StreamStore<Exception, TmdbSuccess>{

  final ITmdbUsecaseSeries usecase;

  TmdbSeriesStore(this.usecase) : super(TmdbSuccess(TmdbEntity(results: [])));


  Future<void> getSeries() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(TmdbSuccess(r)));

  }

}