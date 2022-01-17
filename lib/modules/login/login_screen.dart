// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_import, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable
import 'package:first_app/shared/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSrceen extends StatefulWidget {
  const LoginSrceen({Key? key}) : super(key: key);

  @override
  _LoginSrceenState createState() => _LoginSrceenState();
}

class _LoginSrceenState extends State<LoginSrceen> {
  var user = TextEditingController();
  var password = TextEditingController();
  var color = Colors.redAccent;
  var formkey = GlobalKey<FormState>();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(
            'MDSF',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: color),
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
                            prefixIcon: Icon(
                              Icons.person,
                              color: color,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email address must not be  empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      // Passsowr----------------------------------------
                      TextFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: hidePassword,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: color,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: color,
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password must not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // ignore: sized_box_for_whitespace
                      DefultBouttons(
                        text: 'login',
                        background: color,
                        width: double.infinity,
                        function: () {
                          if (formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t Have an account? '),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register Now..',
                                style: TextStyle(color: color),
                              ))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
