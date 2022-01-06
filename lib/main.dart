// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore
// ignore: unused_import
import 'package:first_app/counter_screen.dart';
import 'package:first_app/users_Screen.dart';

import 'bmi_result_screen.dart';
import 'bmi_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'messenger_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
