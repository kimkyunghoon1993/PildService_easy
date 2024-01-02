import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  final VisibleModel _visible = VisibleModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 43, 65, 89),
            width: double.infinity,
            height: 150,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 335,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Text('물건 보낼 땐, 필드서비스!!',
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 2.0)),
                        Padding(padding: EdgeInsets.only(bottom: 15.0)),
                        Container(
                          width: 335,
                          height: 36,
                          color: Color.fromARGB(255, 32, 43, 55),
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isScrollControlled: true,
                                            // 모달의 기본 높이 제거
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter bottomState) {
                                                return ListenableBuilder(
                                                    listenable: _visible,
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Visibility(
                                                        visible:
                                                            _visible._isVisible,
                                                        child: Container(
                                                          height: 600,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                    child:
                                                                        Column(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          IconButton(
                                                                              icon: const Icon(Icons.close),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              8,
                                                                              0,
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        '출발지',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '주소 검색',
                                                                                  hintStyle: TextStyle(),
                                                                                  suffixIcon: IconButton(
                                                                                    icon: const Icon(
                                                                                      Icons.search,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      bottomState(() {
                                                                                        _visible.setVisible(false);
                                                                                      });

                                                                                      var secondModal = SecondModal(context, _visible);
                                                                                      secondModal.showSecondModal();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '상세 주소',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '이름',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '전화 번호',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '픽업 기사님께 메시지 전달',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '주소록',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '집',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '회사',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(top: 70.0)),
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 8)),
                                                                                Text(
                                                                                  '최근 배송에서 선택',
                                                                                  style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 8)),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '최근 배송 건이 없습니다.',
                                                                                  style: TextStyle(color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 30.0)),
                                                                            Column(
                                                                              children: [
                                                                                ElevatedButton(
                                                                                  child: Text(
                                                                                    '출발지 설정',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  onPressed: () {},
                                                                                  style: ButtonStyle(
                                                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Colors.green : Colors.grey;
                                                                                    }),
                                                                                    fixedSize: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Size(300, 100) : Size(350, 50);
                                                                                    }),
                                                                                    // Set elevation regardless of states
                                                                                    elevation: MaterialStateProperty.resolveWith((states) {
                                                                                      return 20.0;
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.only(bottom: 40.0)),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              });
                                            },
                                          );
                                        },
                                        child: const Text(
                                          '출발',
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 270,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isScrollControlled: true,
                                            // 모달의 기본 높이 제거
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter bottomState) {
                                                return ListenableBuilder(
                                                    listenable: _visible,
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Visibility(
                                                        visible:
                                                            _visible._isVisible,
                                                        child: Container(
                                                          height: 600,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                    child:
                                                                        Column(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          IconButton(
                                                                              icon: const Icon(Icons.close),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              8,
                                                                              0,
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        '출발지',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '주소 검색',
                                                                                  hintStyle: TextStyle(),
                                                                                  suffixIcon: IconButton(
                                                                                    icon: const Icon(
                                                                                      Icons.search,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      bottomState(() {
                                                                                        _visible.setVisible(false);
                                                                                      });

                                                                                      var secondModal = SecondModal(context, _visible);
                                                                                      secondModal.showSecondModal();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '상세 주소',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '이름',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '전화 번호',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '픽업 기사님께 메시지 전달',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '주소록',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '집',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '회사',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(top: 70.0)),
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 8)),
                                                                                Text(
                                                                                  '최근 배송에서 선택',
                                                                                  style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 8)),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '최근 배송 건이 없습니다.',
                                                                                  style: TextStyle(color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 30.0)),
                                                                            Column(
                                                                              children: [
                                                                                ElevatedButton(
                                                                                  child: Text(
                                                                                    '출발지 설정',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  onPressed: () {},
                                                                                  style: ButtonStyle(
                                                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Colors.green : Colors.grey;
                                                                                    }),
                                                                                    fixedSize: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Size(300, 100) : Size(350, 50);
                                                                                    }),
                                                                                    // Set elevation regardless of states
                                                                                    elevation: MaterialStateProperty.resolveWith((states) {
                                                                                      return 20.0;
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.only(bottom: 40.0)),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              });
                                            },
                                          );
                                        },
                                        child: const Text(
                                          '출발지 설정',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 335,
                          height: 36,
                          color: Color.fromARGB(255, 32, 43, 55),
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isScrollControlled: true,
                                            // 모달의 기본 높이 제거
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter bottomState) {
                                                return ListenableBuilder(
                                                    listenable: _visible,
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Visibility(
                                                        visible:
                                                            _visible._isVisible,
                                                        child: Container(
                                                          height: 600,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                    child:
                                                                        Column(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          IconButton(
                                                                              icon: const Icon(Icons.close),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              8,
                                                                              0,
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        '도착지',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '주소 검색',
                                                                                  hintStyle: TextStyle(),
                                                                                  suffixIcon: IconButton(
                                                                                    icon: const Icon(
                                                                                      Icons.search,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      bottomState(() {
                                                                                        _visible.setVisible(false);
                                                                                      });

                                                                                      var secondModal = SecondModal(context, _visible);
                                                                                      secondModal.showSecondModal();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '상세 주소',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '이름',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '전화 번호',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '픽업 기사님께 메시지 전달',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '주소록',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '집',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '회사',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(top: 70.0)),
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 8)),
                                                                                Text(
                                                                                  '최근 배송에서 선택',
                                                                                  style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 8)),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '최근 배송 건이 없습니다.',
                                                                                  style: TextStyle(color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 30.0)),
                                                                            Column(
                                                                              children: [
                                                                                ElevatedButton(
                                                                                  child: Text(
                                                                                    '도착지 설정',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  onPressed: () {},
                                                                                  style: ButtonStyle(
                                                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Colors.green : Colors.grey;
                                                                                    }),
                                                                                    fixedSize: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Size(300, 100) : Size(350, 50);
                                                                                    }),
                                                                                    // Set elevation regardless of states
                                                                                    elevation: MaterialStateProperty.resolveWith((states) {
                                                                                      return 20.0;
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.only(bottom: 40.0)),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              });
                                            },
                                          );
                                        },
                                        child: const Text(
                                          '도착',
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 270,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isScrollControlled: true,
                                            // 모달의 기본 높이 제거
                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter bottomState) {
                                                return ListenableBuilder(
                                                    listenable: _visible,
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Visibility(
                                                        visible:
                                                            _visible._isVisible,
                                                        child: Container(
                                                          height: 600,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                    child:
                                                                        Column(
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          IconButton(
                                                                              icon: const Icon(Icons.close),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              15,
                                                                              8,
                                                                              0,
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        '도착지',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '주소 검색',
                                                                                  hintStyle: TextStyle(),
                                                                                  suffixIcon: IconButton(
                                                                                    icon: const Icon(
                                                                                      Icons.search,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      bottomState(() {
                                                                                        _visible.setVisible(false);
                                                                                      });

                                                                                      var secondModal = SecondModal(context, _visible);
                                                                                      secondModal.showSecondModal();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '상세 주소',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '이름',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '전화 번호',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Container(
                                                                              height: 30.0,
                                                                              child: TextField(
                                                                                decoration: InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(10),
                                                                                  border: OutlineInputBorder(),
                                                                                  hintText: '픽업 기사님께 메시지 전달',
                                                                                  hintStyle: TextStyle(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '주소록',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '집',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                                Padding(padding: EdgeInsets.only(right: 8.0)),
                                                                                ElevatedButton(
                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all(Colors.white30),
                                                                                    ),
                                                                                    onPressed: () {},
                                                                                    child: Text(
                                                                                      '회사',
                                                                                      style: TextStyle(color: Colors.black),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(top: 70.0)),
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 8)),
                                                                                Text(
                                                                                  '최근 배송에서 선택',
                                                                                  style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 8)),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '최근 배송 건이 없습니다.',
                                                                                  style: TextStyle(color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(padding: EdgeInsets.only(bottom: 30.0)),
                                                                            Column(
                                                                              children: [
                                                                                ElevatedButton(
                                                                                  child: Text(
                                                                                    '도착지 설정',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  onPressed: () {},
                                                                                  style: ButtonStyle(
                                                                                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Colors.green : Colors.grey;
                                                                                    }),
                                                                                    fixedSize: MaterialStateProperty.resolveWith((states) {
                                                                                      return states.contains(MaterialState.pressed) ? Size(300, 100) : Size(350, 50);
                                                                                    }),
                                                                                    // Set elevation regardless of states
                                                                                    elevation: MaterialStateProperty.resolveWith((states) {
                                                                                      return 20.0;
                                                                                    }),
                                                                                  ),
                                                                                ),
                                                                                Padding(padding: EdgeInsets.only(bottom: 40.0)),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              });
                                            },
                                          );
                                        },
                                        child: const Text(
                                          '도착지 설정',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
          Container(
            width: 400,
            height: 400,
            padding: EdgeInsets.only(top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 49)),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(Icons.local_shipping),
                          onPressed: () {}),
                    ),
                    Padding(padding: EdgeInsets.only(left: 100)),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 32, 43, 55),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20.0)),
                Container(
                  width: 280,
                  height: 55,
                  child: Card(
                    color: Color(0xfff0f395),
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
                                    Text(
                                      '카드 한 번 등록하고 1초 결제하세요!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 30.0)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_card)),
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
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
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
                                    Text(
                                      '서비스 이용 안내',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.chevron_right)),
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
          )
        ],
      ),
    );
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

class SecondModal {
  final VisibleModel visibleModel;
  BuildContext context;

  SecondModal(this.context, this.visibleModel);

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
                                  visibleModel.setVisible(true);
                                  Navigator.of(context).pop();
                                }),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(12, 2, 12, 0),
                              child: TextField(
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
                                      onPressed: () {}),
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
                                Text('-동/읍/면/리 + 번지 (예 : 논현동 87-2)'),
                                Text('-도로명 + 건물번호 입력 (예 : 논현로 132길 6)'),
                                Text('-동/읍/면/리 + 번지 (예 : 논현동 87-2)'),
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
