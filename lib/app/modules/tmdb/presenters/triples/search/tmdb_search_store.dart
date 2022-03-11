import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase_search.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/search/tmdb_search_states.dart';

class TmdbSearchStore extends StreamStore<Exception, TmdbSearchSuccess> {
  final ITmdbUsecaseSearch usecase;

  TmdbSearchStore(this.usecase)
      : super(TmdbSearchSuccess(TmdbEntity(results: [])));

  Future<void> getTitle(String searchText) async {
    setLoading(true);
    final result = await usecase(searchText);
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(TmdbSearchSuccess(r)));
  }
}
