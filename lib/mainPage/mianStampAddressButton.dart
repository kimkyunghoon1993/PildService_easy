import 'package:flutter/material.dart';

import 'mianStampAddressIconButton.dart';

void mainStampaddressButton(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // Your bottom sheet content goes here
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text('출발지'),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '주소 검색',
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(bottom: 1.0),
                            icon: const Icon(
                              Icons.search,
                            ),
                            onPressed: () {
                              mainStampaddressIconButton(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '상세 주소',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이름',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '전화번호',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '픽업 기사님께 메시지 전달(선택)',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white54),
                      ),
                      onPressed: () {},
                      child: Text(
                        '주소록',
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white54),
                      ),
                      onPressed: () {},
                      child: Text(
                        '집',
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white54),
                      ),
                      onPressed: () {},
                      child: Text(
                        '회사',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              SizedBox(height: 80.0),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '최근 배송에서 선택',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('최근 배송 건이 없습니다.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 10)),
              ),
              Container(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: Text(
                      '출발지 설정',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
