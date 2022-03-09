

import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';

import '../../infra/models/tmdb_model.dart';

abstract class TmdbStates {}

class TmdbSuccess implements TmdbStates {
  final TmdbModel title;

  TmdbSuccess(this.title);
}
