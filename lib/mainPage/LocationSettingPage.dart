import 'package:flutter/material.dart';

import 'FormModal.dart';

class LocationSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('배송 주문 앱'),
      ),
      body: Column(
        children: <Widget>[
          LocationContainer(
            title: '출발지',
            onTap: () => _showFormModal(context),
          ),
          LocationContainer(
            title: '도착지',
            onTap: () => _showFormModal(context),
          ),
        ],
      ),
    );
  }

  void _showFormModal(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    // ... 다른 TextEditingController 인스턴스들의 초기화 ...

    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true, // 모달이 전체 화면을 사용하도록 설정
      isDismissible: false, // 모달 밖의 영역을 탭해도 닫히지 않도록 설정
      builder: (BuildContext context) {
        return FormModal(
          addressController: addressController,
          // ... 다른 TextEditingController 인스턴스들을 전달 ...
        );
      },
    ).then((_) {
      // 모달이 닫힐 때 TextEditingController 인스턴스들을 정리합니다.
      addressController.dispose();
      // ... 다른 TextEditingController 인스턴스들의 정리 ...
    });
  }
}

class LocationContainer extends StatelessWidget {
  final String title;
  final Function onTap;

  LocationContainer({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(title)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}