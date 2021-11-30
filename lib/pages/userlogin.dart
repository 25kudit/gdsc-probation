// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gdsc/pages/user/userhome.dart';

class User_Login extends StatefulWidget {
  @override
  State<User_Login> createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {
  String name = "";
  bool check = false;
  TextEditingController _name = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset("assets/images/dsc.jpg")),
              SizedBox(height: 30),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: TextFormField(
                  controller: _name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Username cannot be empty";
                    } else if (val.contains(' ')) {
                      return "Username cannot contain spaces";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter Username",
                  ),
                  onChanged: (val) {
                    name = val;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter Password"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (val.length < 6) {
                      return "Password length cannot be less than 6";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 20,
                  width: 300,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/forget");
                    },
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  )),
              SizedBox(
                height: 50,
              ),
              Material(
                color: check ? Colors.transparent : Colors.green,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        check = true;
                      });
                      await Future.delayed(Duration(seconds: 1));

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => User_Home(
                                name: _name.text,
                              )));
                      setState(() {
                        check = false;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40,
                    width: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: check
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login as ",
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/adminlogin");
                    },
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          color: Colors.indigo,
                          decoration: TextDecoration.underline,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New user? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.indigo,
                          decoration: TextDecoration.underline,
                          fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
