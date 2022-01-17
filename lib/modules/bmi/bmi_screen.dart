// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:math';

import 'package:first_app/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120.0;
  int weight = 100;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      // // // // // //
      // // Body// // //
      // // // // // //
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isMale ? Colors.blue : Colors.grey[300]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('images/male.png'),
                                  width: 90,
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isMale ? Colors.white : Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:
                                    !isMale ? Colors.blue : Colors.grey[300]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('images/female.png'),
                                  width: 90,
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: !isMale
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          // // // // // //
          // // Second Part // // //
          // // // // // //
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                  fontSize: 55.0, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Slider(
                            value: height,
                            max: 220.0,
                            min: 80.0,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            })
                      ],
                    ),
                  ))),
          // // // // // //
          // // Third Part // // //
          // // // // // //
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '$age',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    mini: true,
                                    child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    mini: true,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[300]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'weight',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '$weight',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    mini: true,
                                    child: Icon(Icons.remove),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    mini: true,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 60.0,
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                        age: age,
                        isMale: isMale,
                        result: result,
                      ),
                    ));
              },
              child: Text(
                'Calculator',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
