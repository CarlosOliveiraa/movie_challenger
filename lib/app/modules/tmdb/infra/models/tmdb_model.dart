import 'dart:convert';

import 'package:movie_challenger/app/modules/tmdb/domain/entities/results_entity.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/tmdb_entity.dart';

class TmdbModel implements TmdbEntity {
  @override
  final List<ResultEntity> results;

  TmdbModel({required this.results});

  Map<String, dynamic> toMap() {
    return {
      'results': results,
    };
  }

  factory TmdbModel.fromMap(Map map) {
    return TmdbModel(
      results: map['results'] == null
          ? []
          : List<ResultEntity>.from(map['results'].map((e) => ResultEntity(
                title: e['title'],
                backDropPath: e['backdrop_path'],
                voteAverage: e['vote_average'],
              ))).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TmdbModel.fromJson(String source) =>
      TmdbModel.fromMap(json.decode(source));
}
