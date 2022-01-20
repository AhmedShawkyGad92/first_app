// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print,, sized_box_for_whitespace, missing_required_param, import_of_legacy_library_into_null_safe, unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:first_app/modules/archived_taskes/archived_taskes_screen.dart';
import 'package:first_app/modules/done_taskes/done_taskes_screen.dart';
import 'package:first_app/modules/new_taskes/new_taskes_screen.dart';
import 'package:first_app/shared/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    newTaskesScreen(),
    archivedTaskesScreen(),
    doneTaskesScreen()
  ];
  List<String> titles = [
    'New Taskes',
    'Done ',
    'Archived',
  ];

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetOn = false;
  IconData fabicon = Icons.edit;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: tasks.length == null
          ? Center(child: CircularProgressIndicator())
          : screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetOn) {
            if (formKey.currentState!.validate()) {
              insertToDatabase(
                      title: _titleController.text,
                      time: _controller.text,
                      date: _dateController.text)
                  .then((value) {
                getDataFromDatabase(database).then((value) {
                  Navigator.pop(context);
                  setState(() {
                    isBottomSheetOn = false;
                    fabicon = Icons.edit;
                    tasks = value;
                    print(value);
                  });
                });
              });
            }
          } else {
            scaffoldKey.currentState!
                .showBottomSheet((context) => Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.grey[200],
                    child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.title),
                                labelText: 'Title ',
                              ),
                              onSaved: (String? value) {},
                              onTap: () {},
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'title must not be Empty ';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.timer),
                                labelText: 'Time Day',
                              ),
                              onSaved: (String? value) {},
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  _controller.text =
                                      value!.format(context).toString();
                                });
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'time must not be Empty ';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _dateController,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: 'Data ',
                              ),
                              onSaved: (String? value) {},
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-13-02'),
                                ).then((value) {
                                  _dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Data must not be Empty ';
                                }
                                return null;
                              },
                            ),
                          ],
                        ))))
                .closed
                .then((value) {
              isBottomSheetOn = false;
              setState(() {
                fabicon = Icons.edit;
              });
            });
            isBottomSheetOn = true;
            setState(() {
              fabicon = Icons.add;
            });
          }
        },
        child: Icon(
          fabicon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Taskes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
      print('db Created');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('table Created');
      }).catchError((err) {
        print('error created tables ${err.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        setState(() {
          tasks = value;
        });
        print(value);
      });
      print('database openened');
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks (title, data, time, status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted Done !!');
      }).catchError((err) {
        print('error insert to tables ${err.toString()}');
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
