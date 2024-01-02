import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainStampaddressIconButtonModel.dart';

  class MainStampAddressModel extends StatefulWidget {
    final TextEditingController? addressController;
    const MainStampAddressModel({Key? key, this.addressController}) : super(key: key);

  @override
  State<MainStampAddressModel> createState() => _MainStampAddressModelState();
  }

  class _MainStampAddressModelState extends State<MainStampAddressModel> {

  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;

  bool? isChecked = false;
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  final _detailedaddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();
  final VisibleModel _visible = VisibleModel();
  final isObscure = false;
  late final String address;


  void _trySubmitForm() { // 출발지 설정 버튼 클릭시 form 안에 있는 내용 전송 할 값
    if (_formKey.currentState?.validate() ?? false) {
      print(
          'Address: ${_addressController.text},'
          'Name: ${_nameController.text},'
          'Detailed Address ${_detailedaddressController.text},'
          'Phone Number: ${_phoneNumberController.text},'
          'Message: ${_messageController.text}');

      Navigator.pop(context, _addressController.text);
    }
  }

  void _checkFormFields() { // input null 값 확인
    bool isFormFilled =
        _nameController.text.isNotEmpty &&
        _detailedaddressController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty;
    setState(() {
      _isButtonEnabled = isFormFilled;
    });
  }

    @override
    void initState() {  //initState() 함수는 위젯을 초기화할 때 한 번만 호출한다
      super.initState();
      if (widget.addressController != null) {
        _addressController.text = widget.addressController!.text;
        // Assuming you want to sync changes in the external controller with the local one.
        widget.addressController!.addListener(() {
          _addressController.text = widget.addressController!.text;
        });
      }
      _nameController.addListener(_checkFormFields);
      _detailedaddressController.addListener(_checkFormFields);
      _phoneNumberController.addListener(_checkFormFields);
    }

  @override
  void dispose() {    // dispose State 객체를 소멸할 때 호출합니다 java 에서 clean 하듯이 라고 이해하면 되나?
    _nameController.dispose();
    _detailedaddressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter bottomState) {
          return ListenableBuilder(
              listenable: _visible,
              builder: (BuildContext context, Widget? child) {
                return Visibility(
                  visible: _visible._isVisible,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
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
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _visible.setVisible(false);
                                        var secondModal = MainStampaddressIconButtonModel(context, _visible);
                                        secondModal.showSecondModal();
                                      },
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: TextFormField(
                                          controller: _addressController,
                                          obscureText: isObscure,
                                          textInputAction: TextInputAction.next,
                                          // enabled: false,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: '주소 검색',
                                            suffixIcon: IconButton(
                                              padding: EdgeInsets.only(bottom: 1.0),
                                              icon: const Icon(
                                                Icons.search,
                                              ),
                                              onPressed: null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _detailedaddressController,
                                      obscureText: isObscure,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '상세 주소를 입력해 주세요';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        // hintText: '상세 주소를 입력해주세요', input 을 클릭 했을때 보여줄 labelText
                                        labelText: '상세 주소',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      controller: _nameController,
                                      obscureText: isObscure,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '이름 을 입력해 주세요';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '이름',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: TextFormField(
                                      controller: _phoneNumberController,
                                      obscureText: isObscure,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '전화번호 를 입력해 주세요';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '전화번호',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: EdgeInsets.only(bottom: 5.0),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      controller: _messageController,
                                      obscureText: isObscure,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '픽업 기사님께 메시지 전달(선택)',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
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
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  tristate: true,
                                                  value: isChecked,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isChecked = value;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 32.0),
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
                                      onPressed: _isButtonEnabled ? _trySubmitForm : () {
                                        // MaterialPageRoute(builder: (context) => MainStamp("Hello"));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) => _isButtonEnabled ? Color.fromARGB(255, 32, 43, 55) : Colors.grey,
                                        ),
                                      ),
                                      child: Text('출발지 설정',style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}

class VisibleModel with ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  setVisible(bool isVisible) {
    _isVisible = isVisible;
    print('setState: 토글 상태 $_isVisible');
    notifyListeners();
  }
}

