// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// // AppBottomRouter 클래스 정의
// class AppBottomModalRouter {
//   static void fnModalRouter(
//       BuildContext context,
//       int modalIndex, {
//         String trackImagePath = "",
//         int? trackId,
//         int? commentId,
//       }) async {
//
//     final Map<int, Future<dynamic> Function()> modalWidgets = {
//       0: () async {
//
//       },
//       1: () async {
//
//       },
//       2: () async {
//
//       },
//       3: () async {
//
//       },
//       4: () async {
//
//       },
//     };
//
//     // Modal 위젯이 존재하면 showModalBottomSheet 호출
//     if (modalWidgets.containsKey(modalIndex)) {
//       dynamic modalFunction = modalWidgets[modalIndex];
//
//       if (modalFunction != null) {
//         Widget? modalContent = await modalFunction();
//
//         if (modalContent != null) {
//           showModalBottomSheet(
//             context: context,
//             isScrollControlled: true,
//             builder: (BuildContext context) {
//               return modalContent;
//             },
//           );
//         }
//       }
//     }
//   }
//
//   // fnBottomModal을 추가했는데, 이를 필요에 맞게 사용
//   static Future<int?> fnBottomModal(BuildContext context, int modalIndex, {int? trackId}) async {
//     if (modalIndex == 0) {
//       final result = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             content: MyPlayListModalScreen(trackId: trackId!),
//           );
//         },
//       );
//       return result;
//     }
//     return null;
//   }
// }
