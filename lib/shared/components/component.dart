// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget DefultBouttons({
  required double width,
  required Color background,
  required Function() function,
  required String text,
}) =>
    Container(
        width: width,
        color: background,
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ));
Widget buildTaskItem(Map model) => Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              '${model['date']}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    ));
