import 'package:flutter/material.dart';

void mainStampaddressIconButton(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      // Your bottom sheet content goes here
      return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(bottom: 10.0),
                child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              Container(
                // padding: EdgeInsets.only(bottom: 5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '도로명,지번,건물명을 입력하세요',
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(bottom: 1.0),
                      icon: const Icon(
                        Icons.search,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Container(
                width: 350,
                height: 110,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.black, width: 1)),
                padding: EdgeInsets.fromLTRB(15, 2, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text('검색방법',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text('-동/읍/면/리 + 번지 (예 : 논현동 87-2)'),
                    Text('-도로명 + 건물번호 입력 (예 : 논현로 132길 6)'),
                    Text('-동/읍/면/리 + 번지 (예 : 논현동 87-2)'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
