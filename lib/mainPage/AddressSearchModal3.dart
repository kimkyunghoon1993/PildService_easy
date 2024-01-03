// import 'package:flutter/material.dart';
//
// class AddressSearchModal {
//   static void show(BuildContext context, TextEditingController controller) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       isDismissible: false,
//       enableDrag: false,
//       backgroundColor: Colors.transparent, // 배경을 투명하게
//       builder: (BuildContext context) {
//         return AddressSearchModalWidget(controller: controller);
//       },
//     );
//   }
// }
//
// class AddressSearchModalWidget extends StatelessWidget {
//   final TextEditingController controller;
//
//   AddressSearchModalWidget({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     // 모달의 높이를 계산합니다.
//     double screenHeight = MediaQuery.of(context).size.height;
//     double modalHeight = screenHeight * (1 / 3);
//
//     return Container(
//       height: modalHeight,
//       // 모달 내부의 Container에 불투명한 배경색을 설정합니다.
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25.0),
//           topRight: Radius.circular(25.0),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           // ... 위젯들 ...
//         ],
//       ),
//     );
//   }
// }