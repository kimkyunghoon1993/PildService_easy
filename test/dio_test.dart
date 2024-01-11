import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
void main(){
  final dio = Dio();

  test('dio simple test', () async{
    final response = await dio.get('https://dart.dev');
    print(response);
  });
}