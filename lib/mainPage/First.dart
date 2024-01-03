import 'package:flutter/material.dart';

class First extends StatefulWidget{
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First>{
  @override
  Widget build(BuildContext context) {
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
                                        builder: (context) {
                                          return FirstModel();
                                        },
                                        isScrollControlled: true,

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
                                    child: Text('출발지 설정', style: TextStyle(color: Colors.white),),
                                    onPressed: () {

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class FirstModel extends StatefulWidget{
  @override
  _FirstModelState createState() => _FirstModelState();
}

class _FirstModelState extends State<FirstModel>{
  TextEditingController _addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String address = '';
  String name = '';
  String detailedAddress = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      child: Container(
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

          // final newAddress = await showDialog(
          //   context: context,
          //   builder: (BuildContext context) => AddressSearchModal(),
          // );
          //
          // if (newAddress != null) {
          //   setState(() {
          //     _addressController.text = newAddress;
          //   });
          // }

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
