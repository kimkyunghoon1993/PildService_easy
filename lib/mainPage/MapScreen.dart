import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class MapScreen extends StatefulWidget{
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  String? latitude;
  String? longitude;

  double mediaHeight(BuildContext context, double scale) => MediaQuery.of(context).size.height * scale; // 미디어 쿼리 높이를 잡아주는 함수
  double mediaWidth(BuildContext context, double scale) => MediaQuery.of(context).size.width * scale; // 미디어 쿼리 넓이를 잡아주는 함수

  getGeoDate() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('permission are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.latitude.toString();
    });
  }

  @override
  void initState(){
    super.initState();
    getGeoDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('위치정보'),),
      body: Container(
        width: mediaWidth(context, 1),
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '내위치',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '위도 : ${latitude}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '경도 : ${longitude}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),

            ),
          ],
        ),
      ),
    );
  }
}

