// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: Icon(Icons.menu),
        title: Text('MANSOUR\'S SHOP'),
        actions: [
          IconButton(
              onPressed: onNotfai,
              icon: Icon(
                Icons.notification_important,
              )),
          IconButton(
              onPressed: onNotfai,
              icon: Icon(
                Icons.search,
              )),
        ],
        centerTitle: true,
        elevation: 7.0,
      ),
    );
  }

  void onNotfai() {
    print('Hello Ahmed');
  }
}
