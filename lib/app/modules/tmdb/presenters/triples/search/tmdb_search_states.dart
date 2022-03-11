import '../../../domain/entities/tmdb_entity.dart';

abstract class TmdbSearchStates {}

class TmdbSearchSuccess implements TmdbSearchStates {
  final TmdbEntity titles;

  TmdbSearchSuccess(this.titles);
}
