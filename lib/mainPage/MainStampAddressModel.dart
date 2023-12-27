import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainStampaddressIconButtonModel.dart';

class MainStampAddressModel extends StatefulWidget {
  const MainStampAddressModel({super.key});

  @override
  State<MainStampAddressModel> createState() => _MainStampAddressModelState();
}

class _MainStampAddressModelState extends State<MainStampAddressModel> {
  final VisibleModel _visible = VisibleModel();
  final _formKey = GlobalKey<FormState>();
  final isObscure = false;
  bool _isButtonEnabled = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _detailedaddressController = TextEditingController();

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
                                    enabled: false,
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
                                keyboardType: TextInputType.streetAddress,
                                controller: _detailedaddressController,
                                obscureText: isObscure,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '상세 주소를 입력해 주세요';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '상세 주소',
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
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
                                keyboardType: TextInputType.text,
                                obscureText: isObscure,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '픽업 기사님께 메시지 전달(선택)',
                                ),
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
                                onPressed: _isButtonEnabled ? () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing Data')),
                                    );
                                  }
                                }
                                : null,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.disabled)) {
                                        return Colors.grey;
                                      }
                                      return Colors.blue;
                                    },
                                  ),
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
                    ],
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

