// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore
// ignore: unused_import
import 'package:first_app/layout/home_Layout.dart';
import 'package:first_app/layout/newsApp/news_Layout.dart';
import 'package:first_app/modules/counter/counter_screen.dart';
import 'package:first_app/modules/login/login_screen.dart';
import 'package:first_app/shared/bloc_obcerver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/bmi/bmi_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }
}
