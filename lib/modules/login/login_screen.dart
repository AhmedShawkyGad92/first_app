// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_import, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var user = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  // USER NAME----------------------------------------
                  TextFormField(
                    controller: user,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                        labelText: 'User ID',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  // Passsowr----------------------------------------
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(
                        onPressed: () {
                          print(user.text);
                          print(password.text);
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have an account? '),
                      TextButton(
                          onPressed: () {}, child: Text('Register Now..'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
