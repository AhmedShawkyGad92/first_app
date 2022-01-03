// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore
// ignore: unused_import
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
      home: MessengerScreen(),
    );
  }
}
