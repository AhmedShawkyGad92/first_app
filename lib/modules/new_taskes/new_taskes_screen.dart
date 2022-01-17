// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_app/shared/components/component.dart';
import 'package:first_app/shared/constans.dart';
import 'package:flutter/material.dart';

class newTaskesScreen extends StatefulWidget {
  const newTaskesScreen({Key? key}) : super(key: key);

  @override
  _newTaskesScreenState createState() => _newTaskesScreenState();
}

class _newTaskesScreenState extends State<newTaskesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index]),
        separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
        itemCount: tasks.length);
  }
}
