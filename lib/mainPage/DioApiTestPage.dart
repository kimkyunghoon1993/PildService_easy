import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioApiTestPage extends StatefulWidget {
  @override
  _DioApiTestPageState createState() => _DioApiTestPageState();
}

class _DioApiTestPageState extends State<DioApiTestPage> {
  String result = '';
  final dio = Dio();
  final storage = new FlutterSecureStorage();


  void onPressGet() async{
    try{
      var response = await Dio().get('https://reqres.in/api/users?page=2');

      if(response.statusCode == 200){
        setState((){
          result = response.data.toString();
        });
      }
    }catch(e){
      print(e);
    }
  }

  void onPressDeliveryWorkerApp() async {
    const String accessToken = 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJ1c2VySWRcIjpcIjIwMjMwOTE4MDE0MTMyMDI2NEBwaWxkc2VydmljZS5jb21cIixcInRkSWRcIjo0NDN9IiwiaXNzIjoiUGlsZFNlcnZpY2UgY29ycG9yYXRpb24uIiwiaWF0IjoxNzAyMDA4MDY1LCJuYmYiOjE2OTQ5NjI4MDAsImV4cCI6NDg1MDcyMjgwMH0.5-6BiK_kg9EPrfjOBDEIoB_fOFgPUhNwdRlO3IYJFsGTOtC3YgtAOlE18OPR2cwXujDuBEu4tJAKlAwlVFQxWQ';

    Response response = await dio.get('https://devapi.pildservice.com/pldsvc/driver/signature',
      queryParameters: {'tdId': 424},
      options: Options(
        headers: {'Authorization' : accessToken}
      ),
    );
    if(response.statusCode == 200){
      setState((){
        result = response.data.toString();
      });
    } else{
      print('error');
    }

    print(response.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('DIO 라이브 러리 REST API 호출 TEST Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$result'),
                ElevatedButton(
                    onPressed: onPressGet,
                    child: Text('GET')
                ),
                ElevatedButton(
                    onPressed: onPressDeliveryWorkerApp,
                    child: Text('배송워커앱서명상태 조회 ')
                ),
                // ElevatedButton(
                //     // onPressed: onPressClient,
                //     child: Text('Client')
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
