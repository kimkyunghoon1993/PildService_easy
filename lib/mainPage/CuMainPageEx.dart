import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CameraPageEx.dart';

class CuMainPageEx extends StatefulWidget {
  @override
  _CuMainPageExState createState() => _CuMainPageExState();
}

class _CuMainPageExState extends State<CuMainPageEx> {
  int _current = 0;
  final CarouselController _sliderController = CarouselController();
  final CarouselController _sliderController2 = CarouselController();
  List imageList = [
    "assets/image/slider_img1.png",
    "assets/image/slider_img2.png",
    "assets/image/slider_img3.png",
  ];

  List imageList2 = [
    "assets/image/slider2_img1.png",
    "assets/image/slider2_img2.png",
  ];

  double mediaHeight(BuildContext context, double scale) => MediaQuery.of(context).size.height * scale; // 미디어 쿼리 높이를 잡아주는 함수
  double mediaWidth(BuildContext context, double scale) => MediaQuery.of(context).size.width * scale; // 미디어 쿼리 넓이를 잡아주는 함수

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Text('Width 기기별 넓비: ' + MediaQuery.of(context).size.width.toString()),
                // Text('Height 기기별 높이: ' + MediaQuery.of(context).size.height.toString()),
                // Text('AspectRatio 가로세로크기의 비율: ' + MediaQuery.of(context).size.aspectRatio.toString()),
                // Text('AspectRatio 소수점 2자리 까지 표현: ' + MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)),
                Container(
                  width: mediaWidth(context, 1),
                  height: 50,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    children: [
                      Container(
                        width: mediaWidth(context, 0.2),
                        height: 100,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                        child:
                        Image(image: AssetImage('assets/image/cu_logo.png')),
                      ),
                      Container(
                        width: mediaWidth(context, 0.69),
                        height: 100,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                        child: SizedBox(
                          width: 250,
                        ),
                      ),
                      Container(
                          width: mediaWidth(context, 0.10),
                          height: 100,
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          )),
                    ],
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  width: mediaWidth(context, 1),
                  height: 150,
                  child: SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        sliderWidget(),
                        sliderIndicator(),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: mediaWidth(context, 1),
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 79, 204, 51),
                      foregroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.save),
                    label: TextButton(
                      onPressed: () async{
                        final cameras = await availableCameras();
                        final firstCamera = cameras.first;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)));

                      },
                      child: Text('사진찍기'),
                    ),
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  width: mediaWidth(context, 1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            child: Image(
                                image:
                                AssetImage('assets/image/cu_event.png.png')),
                          ),
                          Container(
                            width: 150,
                            child: Image(
                                image: AssetImage('assets/image/cu_icon2.png')),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            child: Image(
                                image: AssetImage('assets/image/cu_icon3.png')),
                          ),
                          Container(
                            width: 150,
                            child: Image(
                                image: AssetImage('assets/image/cu_icon4.png')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: mediaWidth(context, 1),
                  height: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: mediaWidth(context, 0.2),
                        child: Image(
                          image: AssetImage('assets/image/cu_imgbox.png'),
                        ),
                      ),
                      Container(
                          // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 28.0)),
                              Text('취약계층 희망 배송 프로젝트', style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),),
                              Text('택배 1건당 = 1원 적립!', style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  letterSpacing: 1.0),),
                            ],
                          )
                      ),
                      Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 30.0)),
                              Container(
                                color: Color.fromARGB(255, 101, 220, 73),
                                child: Text('목표금액 300만원', style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 32, 114, 13),),),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: mediaWidth(context, 1),
                  height: 130,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                        child: Card(
                          color: Color.fromARGB(255, 224, 187, 238),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 90,
                                // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 8.0),
                                    height: 29,
                                    width: 100,
                                    // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                                    child: Card(
                                      color: Color.fromARGB(255, 128, 31, 166),
                                      child: Text('CU택배상품권 5%할인',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 8,),textAlign: TextAlign.center,),
                                    ),
                                  ),
                                    Container(
                                      width: 100,
                                      height: 29,
                                      padding: EdgeInsets.only(left: 8.0),
                                      // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                                      child: Image(image: AssetImage('assets/image/cu_kofon.png')),
                                    ),
                                    Container(
                                      height: 29,
                                      // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                                      child: TextButton(
                                          onPressed: (){},
                                          child: Text('쿠폰몰 바로가기',style: TextStyle(color: Colors.grey,fontSize: 8.0,fontWeight: FontWeight.bold),),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            // Container(
                            //   width: 110,
                            //   height: 100,
                            //   decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                            //   child: Card(
                            //     color: Color.fromARGB(255, 128, 31, 166),
                            //     child: Text('CU택배상품권 5%할인',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                            //   ),
                            // )
                          ),
                        ),

                      ),
                      Container(
                        width: 150,
                        height: 100,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                        child: Card(
                          child: Image(image: AssetImage('assets/image/cu_cear2.png')),
                        ),

                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  child: SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        sliderWidget2(),
                        sliderIndicator2(),
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

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _sliderController,
      items: imageList.map(
            (imgList) {
          return Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    imgList,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList
            .asMap()
            .entries
            .map((entry) {
          return GestureDetector(
            onTap: () => _sliderController.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget sliderWidget2() {
    return CarouselSlider(
      carouselController: _sliderController2,
      items: imageList2.map(
            (imgList) {
          return Builder(
            builder: (context) {
              return Container(
                // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                width: 350,
                height: 200,
                child: Card(
                  child: Image(fit: BoxFit.fill, image: AssetImage(imgList,),),
                )
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
          });
        },
      ),
    );
  }

  Widget sliderIndicator2() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList2
            .asMap()
            .entries
            .map((entry) {
          return GestureDetector(
            onTap: () => _sliderController2.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme
                      .of(context)
                      .brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
