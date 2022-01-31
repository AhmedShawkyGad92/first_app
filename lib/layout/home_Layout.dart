// ignore_for_file: must_be_immutable, file_names, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

import 'package:first_app/shared/cubit/cubit.dart';
import 'package:first_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetOn = false;
  IconData fabicon = Icons.edit;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text(cubit.titles[cubit.currentIndex]),
              ),
              body: cubit.tasks.length == null
                  ? const Center(child: CircularProgressIndicator())
                  : cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (isBottomSheetOn) {
                    if (formKey.currentState!.validate()) {
                      // insertToDatabase(
                      //         title: _titleController.text,
                      //         time: _controller.text,
                      //         date: _dateController.text)
                      //     .then((value) {
                      //   getDataFromDatabase(database).then((value) {
                      //     Navigator.pop(context);
                      //     // setState(() {
                      //     //   isBottomSheetOn = false;
                      //     //   fabicon = Icons.edit;
                      //     //   tasks = value;
                      //     //   print(value);
                      //     // });
                      //   });
                      // });
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) => Container(
                            padding: const EdgeInsets.all(20.0),
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
                                          lastDate:
                                              DateTime.parse('2022-13-02'),
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
                      // setState(() {
                      //   fabicon = Icons.edit;
                      // });
                    });
                    isBottomSheetOn = true;
                    // setState(() {
                    //   fabicon = Icons.add;
                    // });
                  }
                },
                child: Icon(
                  fabicon,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: AppCubit.get(context).currentIndex,
                onTap: (index) {
                  AppCubit.get(context).changeIndex(index);
                },
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Taskes',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'Done',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'Archived',
                  ),
                ],
              ),
            );
          }),
    );
  }
}
