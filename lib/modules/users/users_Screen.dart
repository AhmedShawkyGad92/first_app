// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:first_app/models/user/users_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'Ahmed', phone: '01210540340'),
    UserModel(id: 2, name: 'Sheen', phone: '01210333555'),
    UserModel(id: 3, name: 'Ali', phone: '01210456321'),
    UserModel(id: 4, name: 'Hani', phone: '01210654238'),
    UserModel(id: 5, name: 'Yahya', phone: '01210340840'),
    UserModel(id: 6, name: 'Mara', phone: '01210340540'),
    UserModel(id: 7, name: 'Mina', phone: '01210340549')
  ];

  UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        // Start Body
        body: ListView.separated(
            itemBuilder: (context, index) => bulidUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                  child: Container(
                    width: double.maxFinite,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
            itemCount: users.length));
  }

  Widget bulidUserItem(UserModel user) => Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              child: Text(
                '${user.id}', //ID frome class model
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name, //name frome class model
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  user.phone, //phone frome class model
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      );
}
