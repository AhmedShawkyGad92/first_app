// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class archivedTaskesScreen extends StatefulWidget {
  const archivedTaskesScreen({Key? key}) : super(key: key);

  @override
  _archivedTaskesScreenState createState() => _archivedTaskesScreenState();
}

class _archivedTaskesScreenState extends State<archivedTaskesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('archivedTaskesScreen'),
    );
  }
}
