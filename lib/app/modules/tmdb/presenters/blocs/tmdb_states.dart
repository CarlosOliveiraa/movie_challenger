import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';

abstract class BlocStates {}

class BlocLoad extends BlocStates {}

class BlocSuccess extends BlocStates {
  final TmdbEntity titles;

  BlocSuccess(this.titles);
}

class BlocError implements BlocStates {}

class BlocStart implements BlocStates {}
