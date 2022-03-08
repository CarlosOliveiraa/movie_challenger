import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_challenger/app/modules/tmdb/external/datasources/all_dio_datasource.dart';


import '../../../utils/api_return.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = AllDioDatasource(dio);
  final request = RequestOptions(path: "");
  test('Deve retornar os dados do Dio sem erro', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonEncode(allReturn),
          requestOptions: request,
          statusCode: 200,
        ));
    final future =  datasource.showTitle();
    
    expect(future, completes);
  });
}
