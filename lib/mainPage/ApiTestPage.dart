import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiTestPage extends StatefulWidget {
  @override
  _ApiTestPageState createState() => _ApiTestPageState();
}

class _ApiTestPageState extends State<ApiTestPage>{
  String result = '';
  double mediaHeight(BuildContext context, double scale) => MediaQuery.of(context).size.height * scale; // 미디어 쿼리 높이를 잡아주는 함수
  double mediaWidth(BuildContext context, double scale) => MediaQuery.of(context).size.width * scale; // 미디어 쿼리 넓이를 잡아주는 함수


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
             home: Scaffold(
            appBar: AppBar(
              title: Text('HTTP 라이브 러리 REST API 호출 TEST Page'),
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
                      onPressed: onPressPost,
                      child: Text('POST')
                  ),
                  ElevatedButton(
                      onPressed: onPressClient,
                      child: Text('Client')
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

  onPressGet() async{
    Map<String,String> headers = {
      "content-type" : "application/json",
      "accept" : "application/json",
    };
    http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers : headers);
    if(response.statusCode == 200){
      setState((){
        result = response.body;
      });
    } else {
      print('error.....');
    }
  }

  onPressPost() async{
    try{
      http.Response response = await http.post(
          Uri.parse('https://jsonplaceholder.typeicode.com/posts'),
          body: {'title' : 'hello', 'body': 'world' , 'userId': '1'});
      print('statusCode : ${response.statusCode}');
      if (response == 200 || response.statusCode == 201){
        setState(() {
          result = response.body;
        });
      } else {
        print('error');
      }
    }catch (e){
      print('error....$e');
    }
  }

  onPressClient() async {
    var client = http.Client();
    try{
      http.Response response = await client.post(
          Uri.parse('https://jsonplaceholder.typeicode.com/posts'),
          body: {'title' : 'hello', 'body': 'world','userId': '1'});

      if(response.statusCode == 200 || response.statusCode == 201){
        response = await client
            .get(Uri.parse('https://jsonplaceholder.typeicode.com/posts/1'));
        setState(() {
          result = response.body;
        });
      }else{
        print('error...');
      }
    }finally{
      client.close();
    }
  }

}