import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_challenger/app/modules/tmdb/errors/tmdb_errors.dart';

import 'package:movie_challenger/app/modules/tmdb/external/datasources/all_dio_datasource.dart';

import '../../../utils/api_return.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = AllDioDatasource(dio);
  final request = RequestOptions(path: "");
  test('Deve retornar os dados do Dio sem erro', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: allReturn,
          requestOptions: request,
          statusCode: 200,
        ));
    final future = datasource.showTitle();

    expect(future, completes);
  });
  test('Deve retornar um DiodatasourceError em caso de falha de dio', () async {
    when(() => dio.get(any())).thenThrow(
      DioError(
        requestOptions: request,
        response: Response(
          requestOptions: request,
          statusCode: 401,
          data: {},
        ),
      ),
    );
    final future = datasource.showTitle();
    expect(future, throwsA(isA<DioDatasourceErro>()));
  });
}
