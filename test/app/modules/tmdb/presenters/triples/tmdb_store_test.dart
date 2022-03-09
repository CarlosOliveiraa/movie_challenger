import 'package:movie_challenger/app/modules/tmdb/presenters/triples/tmdb_store.dart';

import 'package:triple_test/triple_test.dart';

class TmdbStoreMock extends MockStore<Exception, int> implements TmdbStore {}

void main() {
  final mock = TmdbStoreMock();
}
