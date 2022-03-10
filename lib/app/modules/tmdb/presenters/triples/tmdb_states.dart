import '../../domain/entities/tmdb_entity.dart';

abstract class TmdbStates {}


class TmdbSuccess implements TmdbStates{
  final TmdbEntity titles;
  TmdbSuccess(this.titles);
}


