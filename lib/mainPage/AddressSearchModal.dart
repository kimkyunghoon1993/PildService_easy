import 'package:flutter/material.dart';

class AddressSearchModal extends StatefulWidget {
  @override
  _AddressSearchModalState createState() => _AddressSearchModalState();
}

class _AddressSearchModalState extends State<AddressSearchModal> {
  String searchAddress = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('주소 검색'),
      content: TextField(
        onChanged: (value) {
          setState(() {
            searchAddress = value;
          });
        },
        decoration: InputDecoration(
          labelText: '주소 입력',
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('확인'),
          onPressed: () {
            Navigator.of(context).pop(searchAddress);
          },
        ),
      ],
    );
  }
}