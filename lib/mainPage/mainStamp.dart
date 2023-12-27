import 'package:flutter/material.dart';

import 'MainStampAddressModel.dart';


class MainStamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: 450,
                maxHeight: 150
              ),
              color: Color.fromARGB(255, 43, 65, 89),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 7),
                    child: Text('물건 보낼 땐 필드 서비스!!',style: TextStyle(color: Colors.white),),
                  ),
                  Container(
                    width: 350,
                    height: 45,
                    padding: EdgeInsets.only(bottom: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Container(
                        color: Color.fromARGB(255, 32, 43, 55),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      child: Text('출발',style: TextStyle(color: Colors.deepOrange),),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return MainStampAddressModel();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 286,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      child: Text('출발지 설정',style: TextStyle(color: Colors.white),),
                                      onPressed: (){

                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      child: Container(
                        color: Color.fromARGB(255, 32, 43, 55),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      child: Text('도착',style: TextStyle(color: Colors.deepOrange),),
                                      onPressed: (){

                                      },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 286,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      child: Text('도착지 설정',style: TextStyle(color: Colors.white),),
                                      onPressed: (){

                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: IconButton(
                            icon: const Icon(Icons.local_shipping),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 280,
              height: 55,
              child: Card(
                color: Color(0xfff0f395),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 42,
                            child: Row(
                              children: [
                                Text('카드 한 번 등록하고 1초 결제하세요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                Padding(padding: EdgeInsets.only(right: 30.0)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.add_card)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 280,
              height: 75,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(

                            height: 42,
                            child: Row(
                              children: [
                                Text('서비스 이용 안내',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
