import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  // String? username;
  FirebaseAuth auth;

  /////////////////////
  bool isAdmin = false;
  /////////////////////

  CustomUser(this.auth) {
    //usernameInit(auth);
  }

  // void usernameInit(FirebaseAuth auth) async {
  //   if (auth.currentUser != null) {
  //     username = prefs.getString('username');
  //   } else {
  //     prefs.remove('username');
  //   }
  // }
}
