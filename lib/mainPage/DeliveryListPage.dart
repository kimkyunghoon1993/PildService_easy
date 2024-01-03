import 'package:flutter/material.dart';

class DeliveryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Delivery'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: '배송 ',
                                style: TextStyle(
                                  color: Color(0xFF222224),
                                  fontSize: 18,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                ),
                              ),
                              TextSpan(
                                text: '1842',
                                style: TextStyle(
                                  color: Color(0xFF565DFC),
                                  fontSize: 18,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                ),
                              ),
                            ]
                        )
                    )
                  ],
                )
            ),
            Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: '집화 ',
                                style: TextStyle(
                                  color: Color(0xFF222224),
                                  fontSize: 18,
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                ),
                              ),
                            ]
                        )
                    )
                  ],
                )
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            child: Image(
                              image: AssetImage('assets/image/camera-create.png'),
                            ),
                          ),
                          Container(
                            child: Text(
                              '배송 추가하기',
                              style: TextStyle(
                                color: Color(0xFF222224),
                                fontSize: 16,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                              ),
                            ),
                          ),
                          Container(
                            child: Container(child: Icon(Icons.chevron_right)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 128,
                    color: Colors.white,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            height: 180,
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.black, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  height: 40,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 28,
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Card(
                                            color: Color(0xFF565DFC),
                                            child: Text(
                                              '1842',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w900,
                                                height: 0,
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        padding: EdgeInsets.only(top: 1.0),
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Text(
                                          '15:40:12',
                                          style: TextStyle(
                                            color: Color(0xFFDBDBDB),
                                            fontSize: 10,
                                            fontFamily: 'Noto Sans KR',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 33,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Text(
                                    '3337-5249-1144',
                                    style: TextStyle(
                                      color: Color(0xFF222224),
                                      fontSize: 20,
                                      fontFamily: 'Noto Sans KR',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    height: 32,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //     Border.all(color: Colors.black, width: 1)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 32,
                                          // decoration: BoxDecoration(
                                          // border:
                                          // Border.all(color: Colors.black, width: 1)),
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Card(
                                            color: Color(0xFFF9F9F9),
                                            child: Text(
                                              '문앞배송',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF222224),
                                                fontSize: 10,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 75,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEFEFEF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Container(
                                    width: 45.60,
                                    height: 45.60,
                                    color: Colors.grey,
                                      child: Image(
                                      image: AssetImage('assets/image/imagesmode_FILL0_wght400_GRAD0_opsz24.png'),
                                      ),
                              ),
                          ),
                        ],
                      ),
                    ),
                    // child: const Card(
                    //     child: Text('Entry D'),
                    // ),
                  ),
                  Container(
                    height: 128,
                    color: Colors.white,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            height: 180,
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.black, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  height: 40,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 28,
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Card(
                                            color: Color(0xFF565DFC),
                                            child: Text(
                                              '1841',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w900,
                                                height: 0,
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        padding: EdgeInsets.only(top: 1.0),
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Text(
                                          '15:39:12 ',
                                          style: TextStyle(
                                            color: Color(0xFFDBDBDB),
                                            fontSize: 10,
                                            fontFamily: 'Noto Sans KR',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 33,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Text(
                                    '7892-5821-1257',
                                    style: TextStyle(
                                      color: Color(0xFF222224),
                                      fontSize: 20,
                                      fontFamily: 'Noto Sans KR',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    height: 32,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //     Border.all(color: Colors.black, width: 1)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 32,
                                          // decoration: BoxDecoration(
                                          // border:
                                          // Border.all(color: Colors.black, width: 1)),
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Card(
                                            color: Color(0xFFFEE101),
                                            child: Text(
                                              '경비실배송',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF222224),
                                                fontSize: 10,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 75,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEFEFEF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Container(
                                child: Image(
                                  image: AssetImage('assets/image/1841.png'),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    // child: const Card(
                    //     child: Text('Entry D'),
                    // ),
                  ),
                  Container(
                    height: 128,
                    color: Colors.white,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            height: 180,
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.black, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  height: 40,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 28,
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Card(
                                            color: Color(0xFF565DFC),
                                            child: Text(
                                              '1840',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w900,
                                                height: 0,
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        padding: EdgeInsets.only(top: 1.0),
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Text(
                                          '15:38:55 ',
                                          style: TextStyle(
                                            color: Color(0xFFDBDBDB),
                                            fontSize: 10,
                                            fontFamily: 'Noto Sans KR',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 33,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Text(
                                    '4731-9531-3156',
                                    style: TextStyle(
                                      color: Color(0xFF222224),
                                      fontSize: 20,
                                      fontFamily: 'Noto Sans KR',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    height: 32,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //     Border.all(color: Colors.black, width: 1)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 32,
                                          // decoration: BoxDecoration(
                                          // border:
                                          // Border.all(color: Colors.black, width: 1)),
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Card(
                                            color:  Color(0xFF222224),
                                            child: Text(
                                              '교환',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 75,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEFEFEF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Container(
                                  width: 45.60,
                                  height: 45.60,
                                  child: Image(
                                    image: AssetImage('assets/image/1840.png'),
                                  ),
                              )
                          ),
                        ],
                      ),
                    ),
                    // child: const Card(
                    //     child: Text('Entry D'),
                    // ),
                  ),
                  Container(
                    height: 128,
                    color: Colors.white,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 230,
                            height: 180,
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.black, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  height: 40,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 28,
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Card(
                                            color: Color(0xFF565DFC),
                                            child: Text(
                                              '1839',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w900,
                                                height: 0,
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        padding: EdgeInsets.only(top: 1.0),
                                        // decoration: BoxDecoration(
                                        //     border:
                                        //     Border.all(color: Colors.black, width: 1)),
                                        child: Text(
                                          '15:38:55 ',
                                          style: TextStyle(
                                            color: Color(0xFFDBDBDB),
                                            fontSize: 10,
                                            fontFamily: 'Noto Sans KR',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 33,
                                  // decoration: BoxDecoration(
                                  //     border:
                                  //     Border.all(color: Colors.black, width: 1)),
                                  child: Text(
                                    '3337-5249-1144',
                                    style: TextStyle(
                                      color: Color(0xFF222224),
                                      fontSize: 20,
                                      fontFamily: 'Noto Sans KR',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    height: 32,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //     Border.all(color: Colors.black, width: 1)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 32,
                                          // decoration: BoxDecoration(
                                          // border:
                                          // Border.all(color: Colors.black, width: 1)),
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: Card(
                                            color: Color(0xFFFEE101),
                                            child: Text(
                                              '경비실배송',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF222224),
                                                fontSize: 10,
                                                fontFamily: 'Noto Sans KR',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 75,
                              height: 75,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEFEFEF),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Container(
                                width: 45.60,
                                height: 45.60,
                                color: Colors.grey,
                                child: Image(
                                  image: AssetImage('assets/image/imagesmode_FILL0_wght400_GRAD0_opsz24.png'),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    // child: const Card(
                    //     child: Text('Entry D'),
                    // ),
                  ),
                ],
              ),
              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: const Card(child: Text('Entry A')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}