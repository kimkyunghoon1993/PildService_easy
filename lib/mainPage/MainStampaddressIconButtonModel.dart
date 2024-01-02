import 'package:flutter/material.dart';

import 'MainStampAddressModel.dart';

class MainStampaddressIconButtonModel {
  final VisibleModel visibleModel;
  BuildContext context;
  MainStampaddressIconButtonModel(this.context, this.visibleModel,);
  final _addressController = TextEditingController();

  void showSecondModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ListenableBuilder(
            listenable: visibleModel,
            builder: (BuildContext context, Widget? child) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter bottomState) {
                return Container(
                  width: 400,
                  height: 600, // 적절한 높이로 조절하세요
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 2, 5),
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  // 데이터 같이 넘길 수 있음
                                  _addressController.text;
                                  visibleModel.setVisible(true);
                                  print(_addressController);
                                  Navigator.of(context).pop();
                                }),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(12, 2, 12, 0),
                              child: TextField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(),
                                  hintText: '도로명,지번,건물명을 입력하세요',
                                  hintStyle: TextStyle(),
                                  suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                      ),
                                      onPressed: () {
                                        _addressController.text;
                                        visibleModel.setVisible(true);
                                        print(_addressController.toString());
                                        Navigator.of(context).pop();
                                      }),
                                ),
                              )),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: 350,
                            height: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 8.0)),
                                Text(
                                  '검색방법',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(padding: EdgeInsets.only(top: 8.0)),
                                Text('-동/읍/면/리 + 번지 (예:논현동 87-2)'),
                                Text('-도로명 + 건물번호 입력 (예:논현로 132길 6)'),
                                Text('-건물명 (예 :강남소방서)'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              });
            });
      },
    );
  }
}
