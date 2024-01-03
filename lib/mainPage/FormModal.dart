import 'package:flutter/material.dart';

class FormModal extends StatefulWidget {
  final TextEditingController addressController;
  // ... 다른 TextEditingController 인스턴스들 ...

  FormModal({
    Key? key,
    required this.addressController,
    // ... 다른 TextEditingController 인스턴스들의 생성자 매개변수 ...
  }) : super(key: key);

  @override
  _FormModalState createState() => _FormModalState();
}


class _FormModalState extends State<FormModal> {
  final TextEditingController _addressController = TextEditingController();
  // ... 다른 필드에 대한 TextEditingController들 ...

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double formModalHeight = screenHeight * (2 / 3);

    return Container(
      padding: EdgeInsets.all(20),
      height: formModalHeight,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _addressController,
              // ... TextFormField의 다른 속성들 ...
              decoration: InputDecoration(
                labelText: '주소',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // AddressSearchModal을 호출하면서 현재의 TextEditingController를 전달합니다.
                    // AddressSearchModal.show(context, _addressController);
                  },
                ),
              ),
            ),
            // ... 다른 입력 필드들 ...
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    // ... 다른 TextEditingController들의 dispose 호출 ...
    super.dispose();
  }
}