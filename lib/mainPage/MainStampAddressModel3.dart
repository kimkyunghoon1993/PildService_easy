import 'package:flutter/material.dart';

class MainStampAddressModel extends StatefulWidget {
  const MainStampAddressModel({super.key});

  @override
  State<MainStampAddressModel> createState() => _MainStampAddressModelState();
}

class _MainStampAddressModelState extends State<MainStampAddressModel> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void _trySubmitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Name: ${_nameController.text}, Age: ${_ageController.text}, Phone Number: ${_phoneNumberController.text}');
    }
  }

  void _checkFormFields() {
    bool isFormFilled = _nameController.text.isNotEmpty && _ageController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty;
    setState(() {
      _isButtonEnabled = isFormFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkFormFields);
    _ageController.addListener(_checkFormFields);
    _phoneNumberController.addListener(_checkFormFields);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '이름'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: '나이'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '나이를 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: '전화 번호'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '전화 번호를 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _trySubmitForm : null,
                child: Text('제출하기'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => _isButtonEnabled ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
