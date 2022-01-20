// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget DefultBouttons({
  required double width,
  double radius = 3.0,
  required Color background,
  required Function function,
  required String text,
}) =>
    Container(
        width: width,
        height: 40.0,
        color: background,
        child: MaterialButton(
          onPressed: () {
            function();
          },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              '${model['data']}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    ));

Widget defultTextFiled({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  Function? onSaved,
  bool isPassword = false,
  required Function validate,
  required String lable,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onSaved: (s) {
        onSaved!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate(s);
      },
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
// defult appbar
Widget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_left,
        ),
      ),
      titleSpacing: 5.0,
      title: Text(
        title ?? '',
      ),
      actions: actions,
    );
