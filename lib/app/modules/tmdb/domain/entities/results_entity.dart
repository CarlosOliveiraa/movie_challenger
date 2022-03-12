class ResultEntity {
  final String title;
  final String backDropPath;
  final double voteAverage;
  final String mediaType;
  final String language;
  final String overview;
  

  ResultEntity( {
    required this.title,
    required this.backDropPath,
    required this.voteAverage,
    required this.mediaType,
    required this.language, 
    required this.overview,
  });
}
