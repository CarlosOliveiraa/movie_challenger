import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';


import '../../../domain/usecases/tmdb_usecase_movies.dart';
import '../tmdb_states.dart';

class TmdbMoviesStore extends StreamStore<Exception, TmdbSuccess>{

  final ITmdbUsecaseMovies usecase;

  TmdbMoviesStore(this.usecase) : super(TmdbSuccess(TmdbEntity(results: [])));


  Future<void> getMovies() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(TmdbSuccess(r)));
  }

}