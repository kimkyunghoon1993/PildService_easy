import 'package:flutter/material.dart';

import 'AddressSearchModal.dart';

class FormScreen extends StatefulWidget{
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>{
  TextEditingController _addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String address = '';
  String name = '';
  String detailedAddress = '';
  String message = '';



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              renderTextFormField(
                  label: '주소',
                  controller: _addressController,
                  onSaved: (val){
                    setState(() {
                      address = val!;
                    });
                  },
                  validator: (val){
                    if (val == null || val.isEmpty) {
                      return '주소를 입력해 주세요';
                    }
                    return null;
                  }
              ),
              renderTextFormField(
                  label: '이름',
                  onSaved: (val){
                    setState(() {
                      name = val!;
                    });
                  },
                  validator: (val){
                    if (val == null || val.isEmpty) {
                      return '이름을 입력해 주세요';
                    }
                    return null;
                  }
              ),
              renderTextFormField(
                  label: '상세주소',
                  onSaved: (val){
                    setState(() {
                      detailedAddress = val!;
                    });
                  },
                  validator: (val){
                    if (val == null || val.isEmpty) {
                      return '상세주소 를 입력해 주세요';
                    }
                    return null;
                  }
              ),
              renderTextFormField(
                  label: '메시지',
                  onSaved: (val){
                    setState(() {
                      message = val!;
                    });
                  },
                  validator: (val){
                    if (val == null || val.isEmpty) {
                      return '메시지를 입력해 주세요';
                    }
                    return null;
                  }
              ),
              renderSubmitButton(),
              renderStates(),
            ],
          ),
        ),
      ),
    );
  }
  renderStates(){
    return Column(
      children: [
        Text(
            'address: $address'
        ),
        Text(
            'name: $name'
        ),
        Text(
            'detailedAddress: $detailedAddress'
        ),
        Text(
            'message: $message'
        ),
      ],
    );
  }

  renderSubmitButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),),
      onPressed: () async {
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();

          final newAddress = await showDialog(
            context: context,
            builder: (BuildContext context) => AddressSearchModal(),
          );

          if (newAddress != null) {
            setState(() {
              _addressController.text = newAddress;
            });
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('저장 성공! 양식이 저장되었습니다!'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                left: 10,
                right: 10,
              ),
            ),
          );
        }
      },
      child: Text(
        '저장 버튼!',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  renderTextFormField({
    required String label,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
        ),
        Container(height: 16.0,),
      ],
    );
  }

}