// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore
// ignore: unused_import
import 'package:first_app/layout/home_Layout.dart';
import 'package:first_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'modules/bmi/bmi_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
