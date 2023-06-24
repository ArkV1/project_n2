import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomUser {
  SharedPreferences prefs;
  // String? username;
  FirebaseAuth auth;

  /////////////////////
  bool isAdmin = false;
  /////////////////////

  CustomUser(this.prefs, this.auth) {
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
