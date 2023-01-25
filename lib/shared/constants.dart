import 'package:flutter/material.dart';

String firebaseWrongPassword =
    '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.';
String firebaseWrongEmail =
    '[firebase_auth/user-not-found] There is no user record corresponding to this identifier.'
    ' The user may have been deleted.';
String firebaseEmailFormat =
    '[firebase_auth/invalid-email] The email address is badly formatted.';

String emailFormatToastMsg = 'Email is incorrect.';
String emailToastMsg = 'This Email Address not registered yet.';
String passToastMsg = 'Password is wrong please try again !.';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

const backgroundColor = Color(0xFF113861);

Color botBackgroundColor = Color(0xFF113861).withOpacity(0.9);

Color defaultColor = const Color(0xffF5A31B);
Color secondaryColor = const Color(0xFF113861);
