
import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier{

  void notify() {
    notifyListeners();
  }


  Future<bool> fnAuthing(User user) async {


    try {

      // await Helpers.apiCall(
      //     "auth/test",
      //     method: "POST",
      //     headers: {
      //       'idToken' :  user.getIdToken().toString()
      //     }
      // );


      return true;


      // final response = await Helpers.apiCall(
      //   "/getAuth",
      //   method: "POST",
      //   headers: {'Content-Type': 'application/json'}, // JSON 형태로 전송
      //   body: {
      //     'memberUid': user.uid,
      //   }, // JSO
      // );

      // if (response != null) {
      //
      //
      //
      // } else {
      //   // 오류 처리
      //   throw Exception('Failed to load data');
      // }

    } catch (error) {
      print('FnSendUid() Error ');
      print('Error: ${error}');
    }


    return false;



  }



}