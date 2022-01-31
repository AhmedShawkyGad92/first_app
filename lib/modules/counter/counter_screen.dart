// ignore_for_file: prefer_const_constructors, must_be_immutable, no_logic_in_create_state, prefer_const_constructors_in_immutables

import 'package:first_app/modules/counter/cubit/cubit.dart';
import 'package:first_app/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('CounterScreen'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.list_sharp))
              ],
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: Text(' - MINUS',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('${CounterCubit.get(context).counter}',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50.0)),
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Text('PLUS + ',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0)))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
