// ignore_for_file: prefer_const_constructors, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterScreen'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list_sharp))],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                child: Text(' - MINUS',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('$counter',
                  style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0)),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text('PLUS + ',
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0)))
          ],
        ),
      ),
    );
  }
}
