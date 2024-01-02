import 'package:flutter/material.dart';
import 'package:pildservice_easy/model/user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String,Object> args = ModalRoute.of(context)?.settings.arguments as Map<String,Object>;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('라우터데이터 전달연습'),
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('TwoScreen',style: TextStyle(color: Colors.white,fontSize: 30),),
                Text('sendData:${args["arg1"]},${args["arg2"]},${(args["arg3"] as User).name}'),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context,'/three');
                }, child: Text('Go three')),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ElevatedButton(
                    onPressed: () {
                  Navigator.pop(context,User('busan','kim','','',''));
                }, child: Text('Pop')),
              ],
            ),
          ),
        ),
      ),
    );
  }

}