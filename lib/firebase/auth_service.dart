import 'package:badboys/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn( /// 웹 oauth2 클라이언트 아이디
      clientId : dotenv.get("WEB_OAUTH_2_CLIENT_ID"),
  );


  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);

    final response = await Helpers.apiCall(
        'auth/login',
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : userCredential.user!.getIdToken().toString()
        },
    );

    return userCredential.user;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }
}
