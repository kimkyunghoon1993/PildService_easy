import 'package:flutter/material.dart';

import 'package:pildservice_easy/model/user.dart';

class ThressScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('라우터연습'),
        ),
        body: Container(
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ThressScreen',style: TextStyle(color: Colors.white,fontSize: 30),),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(
                      context,
                    '/two',
                    arguments: {
                        "arg1": 10,
                        "arg2": "hello",
                        "arg3": User('seoul','testName','성수','01012341234',''),
                    }
                  );
                  print('result:${(required as User).name}');
                }, child: Text('Go Four')),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text('Pop')),
              ],
            ),
          ),
        ),
      ),
    );
  }

}