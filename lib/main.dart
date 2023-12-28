import 'package:flutter/material.dart';
import 'package:work/enterDetails.dart';
import 'package:work/personal.dart';

import 'package:work/verifyEmail.dart';
import 'package:work/verifyOTP.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'personal',
    routes: {
      'verifyOTP': (context) => Verify(),
      'verifyEmail': (context) => VerifyEmail(),
      'enterDetails': (context) => EnterDetails(),
      'personal': (context) => PersonalDetails(),
    },
  ));
}
