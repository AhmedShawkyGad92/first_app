// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:first_app/modules/archived_taskes/archived_taskes_screen.dart';
import 'package:first_app/modules/done_taskes/done_taskes_screen.dart';
import 'package:first_app/modules/new_taskes/new_taskes_screen.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

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
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> tasks = [];

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
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
        tasks = value;
        emit(AppGetDatabaseState());
        print(value);
      });
      print('database openened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
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
