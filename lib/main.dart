import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fincancialmanagement_combined/signin.dart';
import 'package:fincancialmanagement_combined/signup.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => signin(),
      '/home': (context) => signup(),

    },
  )));
}
