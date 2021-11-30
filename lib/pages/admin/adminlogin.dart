// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Admin_Login extends StatefulWidget {
  @override
  State<Admin_Login> createState() => _Admin_LoginState();
}

class _Admin_LoginState extends State<Admin_Login> {
  String name = "";
  bool check = false;
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
                "Welcome Admin $name",
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
                      return "Admin ID cannot be empty";
                    } else if (!val.contains(RegExp(r'[0-9]'))) {
                      return "Admin ID can only contain digits";
                    } else if (val.length != 5) {
                      return "Admin ID should be of 5 digits";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Admin ID",
                    hintText: "Enter 5 digit Admin ID",
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
                    onTap: () {},
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
                height: 100,
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
                      Navigator.pushNamed(context, "/adminhome");
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
           
            ],
          ),
        ),
      ),
    );
  }
}
