abstract class TmdbErrors implements Exception {}

class TitleErros implements TmdbErrors {}

class DatasourceError implements TmdbErrors {}

class DioDatasourceErro implements TmdbErrors {
  final String message;

  DioDatasourceErro({required this.message});
}

class SearchError implements TmdbErrors{}
