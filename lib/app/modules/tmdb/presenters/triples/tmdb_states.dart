
import 'package:movie_challenger/app/modules/tmdb/domain/entities/results_entity.dart';

class TmdbState {


  final List<ResultEntity> list;

  TmdbState({this.list = const []});


  TmdbState copyWith({
    List<ResultEntity>? list,
  }){
    return TmdbState(
      list: list ?? this.list,
    );
  }




}