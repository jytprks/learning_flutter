import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  String password = "";
  bool isTaped = false;
  bool isvalid = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/hey.png",
              fit: BoxFit.cover,
              height: 200,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome ${name}",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter User Name", labelText: "User Name"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(isTaped ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            isTaped = true;
                            isvalid = name.isNotEmpty && password.isNotEmpty;
                          });

                          await Future.delayed(Duration(seconds: 1));
                          if (isvalid)
                            await Navigator.pushNamed(
                                context, MyRouts.homeRoute);
                          setState(() {
                            isTaped = false;
                            isvalid = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: isTaped ? 50 : 500,
                          height: 50,
                          alignment: Alignment.center,
                          child: isTaped
                              ? Icon(
                                  isvalid ? Icons.done : Icons.close,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
