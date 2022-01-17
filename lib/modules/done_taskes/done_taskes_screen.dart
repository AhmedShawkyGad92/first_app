// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class doneTaskesScreen extends StatefulWidget {
  const doneTaskesScreen({Key? key}) : super(key: key);

  @override
  _doneTaskesScreenState createState() => _doneTaskesScreenState();
}

class _doneTaskesScreenState extends State<doneTaskesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('doneTaskesScreen'),
    );
  }
}
