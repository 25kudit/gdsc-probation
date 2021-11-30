// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool check = false;
  TextEditingController _password = TextEditingController();
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
                "Register",
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Username cannot be empty";
                    } else if (val.contains(' ')) {
                      return "Username cannot contain spaces";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "User Email",
                    hintText: "Enter User Email",
                  ),
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
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: "Create Password", hintText: "Enter Password"),
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
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm Password"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (val != _password.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 50,
              ),
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        check = true;
                      });
                      Widget backButton = TextButton(
                        child: Text("LOGIN"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/userlogin");
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: Text("Congratulations"),
                        content: Text("User registration successful"),
                        actions: [backButton],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    }
                    
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
