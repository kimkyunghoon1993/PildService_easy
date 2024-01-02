import 'package:flutter/material.dart';

class DeliveryWorkerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            children: [
              ElevatedButton(
                child: const Text('센터 model'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                '이 마당발 센터가 맞나요?',
                                style: TextStyle(
                                  color: Color(0xFFB4B4B4),
                                  fontSize: 16,
                                  fontFamily: 'Noto Sans KR',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: -0.32,
                                ),
                              ),
                              SizedBox(
                                width: 233,
                                child: Text(
                                  '목련, 목화점',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 28,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: -0.56,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    child: const Text(
                                      '아닙니다',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFA6A6A6),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans KR',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  ElevatedButton(
                                    child: const Text(
                                      '맞습니다',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF565DFC),
                                        fontSize: 16,
                                        fontFamily: 'Noto Sans KR',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                child: const Text('팝업'),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      '이 마당발 센터가 맞나요?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFB4B4B4),
                        fontSize: 16,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.32,
                      ),
                    ),
                    content: const Text(
                      '목련, 목화점',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 28,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.56,
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text(
                              '아닙니다',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFA6A6A6),
                                fontSize: 16,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: -0.32,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              '맞습니다',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF565DFC),
                                fontSize: 16,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: -0.32,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}