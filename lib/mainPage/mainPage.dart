import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainStampState createState() => _MainStampState();
}

class _MainStampState extends State<MainPage>{
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  final _detailedaddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _messageController = TextEditingController();
  final VisibleModel _visible = VisibleModel();
  final isObscure = false;

  void _trySubmitForm() { // 출발지 설정 버튼 클릭시 form 안에 있는 내용 전송 할 값
    if (_formKey.currentState?.validate() == true) {
      print(
          'Address: ${_addressController.text},'
              'Name: ${_nameController.text},'
              'Detailed Address ${_detailedaddressController.text},'
              'Phone Number: ${_phoneNumberController.text},'
              'Message: ${_messageController.text}');

      setState(() {
        _visible.setLocationText(_addressController.text);
      });

      Navigator.pop(context);
    }
  }

  void _checkFormFields() { // input null 값 확인
    bool isFormFilled =
        _addressController.text.isNotEmpty &&
            _nameController.text.isNotEmpty &&
            _detailedaddressController.text.isNotEmpty &&
            _phoneNumberController.text.isNotEmpty;
    _visible.setButtonEnabled(isFormFilled);
  }

  @override
  void initState() {  //initState() 함수는 위젯을 초기화할 때 한 번만 호출한다
    super.initState();
    _addressController.addListener(_checkFormFields);
    _nameController.addListener(_checkFormFields);
    _detailedaddressController.addListener(_checkFormFields);
    _phoneNumberController.addListener(_checkFormFields);
  }

  @override
  void dispose() {    // dispose State 객체를 소멸할 때 호출합니다 java 에서 clean 하듯이 라고 이해하면 되나?
    _addressController.dispose();
    _nameController.dispose();
    _detailedaddressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                                        onPressed: _showModal,
                                        child: Text('출발',style: TextStyle(color: Colors.deepOrange),),
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
                                        onPressed: _showModal,
                                        child: Text(_visible.selectedLocation, style: TextStyle(color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 350,
                        height: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
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
                                        child: Text('도착',style: TextStyle(color: Colors.deepOrange),),
                                        onPressed: _arriveshowModal,
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
                                        onPressed: _arriveshowModal,
                                        child: Text(_visible.selectedArrive,style: TextStyle(color: Colors.white),),
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
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.black, width: 1)),
                            // child: IconButton(
                            //     icon: const Icon(Icons.local_shipping),
                            //     onPressed: () {}),
                            child: SizedBox(width: 100,height: 100,),
                          ),
                          // Container(
                          //   width: 100,
                          //   height: 100,
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.black, width: 1)),
                          // child: IconButton(
                          //     icon: const Icon(Icons.local_shipping),
                          //     onPressed: () {}),
                          // child: Image(image: AssetImage('assets/image/homepick_icon1.png')),
                          ClipPath(
                            clipper: MyClipper(),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              color: Colors.grey,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '여기서 운송장 조회!',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 32, 43, 55),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
          
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                  width: 280,
                  height: 55,
                  child: Card(
                    color: Color(0xfff0f395),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 42,
                                child: Row(
                                  children: [
                                    Text('카드 한 번 등록하고 1초 결제하세요!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                    Padding(padding: EdgeInsets.only(right: 25.0)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.add_card)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 280,
                  height: 75,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 42,
                                child: Row(
                                  children: [
                                    Text('서비스 이용 안내',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              return ListenableBuilder(
                  listenable: _visible,
                  builder: (BuildContext context, Widget? child) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
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
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _addressController,
                                      obscureText: isObscure,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '주소 검색',
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.search),
                                          onPressed: () {
                                            TextEditingController _controller2 = TextEditingController();

                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              enableDrag: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: MediaQuery.of(context).size.height * 0.7,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(16.0),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(0, 8, 2, 5),
                                                          alignment: Alignment.topRight,
                                                          child: IconButton(
                                                            icon: const Icon(Icons.close),
                                                            onPressed: (){
                                                              Navigator.of(context).pop();
                                                            },
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(12, 2, 12, 0),
                                                          child: TextField(
                                                            controller: _controller2,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(),
                                                              labelText: '도로명,지번,건물명을 입력하세요',
                                                              suffixIcon: IconButton(
                                                                icon: Icon(Icons.search),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    _addressController.text = _controller2.text;
                                                                  });
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                          width: 375,
                                                          height: 150,
                                                          decoration: BoxDecoration(
                                                              border:
                                                              Border.all(color: Colors.black45, width: 1)),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(padding: EdgeInsets.only(top: 8.0)),
                                                              Text(
                                                                '검색방법',
                                                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),
                                                              ),
                                                              Padding(padding: EdgeInsets.only(top: 8.0)),
                                                              Text('-동/읍/면/리 + 번지 (예:논현동 87-2)' , style: TextStyle(color: Colors.black45),),
                                                              Text('-도로명 + 건물번호 입력 (예:논현로 132길 6)', style: TextStyle(color: Colors.black45),),
                                                              Text('-건물명 (예 :강남소방서)', style: TextStyle(color: Colors.black45),),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
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
                                        if (value!.length < 11) {
                                          return '전화번호를 정확하게 입력해 주세요';
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
                                      onPressed: _visible.isButtonEnabled ? _trySubmitForm : null,
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) => _visible.isButtonEnabled ? Color.fromARGB(255, 32, 43, 55) : Colors.grey,
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
                    );
                  }
              );
            }
        );
      },
    );
  }

  void _arriveshowModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              return ListenableBuilder(
                  listenable: _visible,
                  builder: (BuildContext context, Widget? child) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
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
                                child: Text('도착지'),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: TextFormField(
                                        readOnly: true,
                                        controller: _addressController,
                                        obscureText: isObscure,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: '주소 검색',
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed: () {
                                              TextEditingController _controller2 = TextEditingController();

                                              showModalBottomSheet(
                                                enableDrag: true,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding: EdgeInsets.all(16.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            padding: EdgeInsets.fromLTRB(0, 8, 2, 5),
                                                            alignment: Alignment.topRight,
                                                            child: IconButton(
                                                              icon: const Icon(Icons.close),
                                                              onPressed: (){
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.fromLTRB(12, 2, 12, 0),
                                                            child: TextField(
                                                              controller: _controller2,
                                                              decoration: InputDecoration(
                                                                border: OutlineInputBorder(),
                                                                labelText: '도로명,지번,건물명을 입력하세요',
                                                                suffixIcon: IconButton(
                                                                  icon: Icon(Icons.search),
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      _addressController.text = _controller2.text;
                                                                    });
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                            width: 375,
                                                            height: 150,
                                                            decoration: BoxDecoration(
                                                                border:
                                                                Border.all(color: Colors.black45, width: 1)),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(padding: EdgeInsets.only(top: 8.0)),
                                                                Text(
                                                                  '검색방법',
                                                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),
                                                                ),
                                                                Padding(padding: EdgeInsets.only(top: 8.0)),
                                                                Text('-동/읍/면/리 + 번지 (예:논현동 87-2)' , style: TextStyle(color: Colors.black45),),
                                                                Text('-도로명 + 건물번호 입력 (예:논현로 132길 6)', style: TextStyle(color: Colors.black45),),
                                                                Text('-건물명 (예 :강남소방서)', style: TextStyle(color: Colors.black45),),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
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
                                          if (value!.length < 12) {
                                            return '전화번호를 정확하게 입력해 주세요';
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
                                      width: 300,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: _visible.isButtonEnabled ? _trySubmitForm : null,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                (Set<MaterialState> states) => _visible.isButtonEnabled ? Color.fromARGB(255, 32, 43, 55) : Colors.grey,
                                          ),
                                        ),
                                        child: Text('도착지 설정',style: TextStyle(color: Colors.white),),
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
                  }
              );
            }
        );
      },
    );
  }

}

// 지금은 ChangeNotifier 에서 상태를 관리
// 나중에는 Provider 또는 Blob 또는 어쨌든 상태관리 라이브러리 사용
class VisibleModel with ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;
  bool _isButtonEnabled = false;
  bool get isButtonEnabled => _isButtonEnabled;
  String _selectedLocation = "출발지 설정";
  String get selectedLocation => _selectedLocation;
  String _selectedArrive = "도착지 설정";
  String get selectedArrive => _selectedArrive;


  setVisible(bool isVisible) {
    _isVisible = isVisible;
    print('setState: 토글 상태 $_isVisible');
    notifyListeners();
  }

  setButtonEnabled(bool isButtonEnabled) {
    _isButtonEnabled = isButtonEnabled;
    print('setButtonEnablede: 토글 상태 $_isButtonEnabled');
    notifyListeners();
  }

  setLocationText(String selectedLocation) {
    _selectedLocation = selectedLocation;
    print('setLocationText: 토글 상태 $_selectedLocation');
    notifyListeners();
  }

  setArriveText(String selectedArrive) {
    _selectedArrive = selectedArrive;
    print('setLocationText: 토글 상태 $_selectedArrive');
    notifyListeners();
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(15, 15);
    path.lineTo(30, 15);
    path.lineTo(30, 5);
    path.quadraticBezierTo(30, 2, 32, 2);
    path.lineTo(48, 15);
    path.lineTo(size.width - 15, 15);
    path.quadraticBezierTo(size.width, 15, size.width, 30);
    path.lineTo(size.width, size.height - 15);
    path.quadraticBezierTo(size.width, size.height, size.width - 15, size.height);  //오른쪽하단
    path.lineTo(15, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 15);
    path.lineTo(0, 30);
    path.quadraticBezierTo(0, 15, 15, 15);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

