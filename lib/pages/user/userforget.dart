// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Forget extends StatelessWidget {
  //bool check = false;
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(children: [
          Form(
            key: _key1,
            child: Column(children: [
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 200,
                child: Image.asset("assets/images/forgotpassword.png"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Recover Password",
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
                      return "Please enter user email";
                    } else if (val.contains(' ')) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "User Email ",
                    hintText: "Enter User email address",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                    if (_key1.currentState!.validate()) {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: Text("Alert"),
                        content: Text("OTP sent successful"),
                        actions: [okButton],
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
                        "Send OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Form(
            key: _key2,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 70,
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter OTP";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Enter OTP ",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () async {
                      if (_key2.currentState!.validate()) {
                        Widget resetButton = TextButton(
                          child: Text("Reset Password"),
                          onPressed: () {},
                        );
                        AlertDialog alert = AlertDialog(
                          title: Text("Alert"),
                          content: Text("OTP verification successful"),
                          actions: [resetButton],
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
                          "Verify OTP",
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
        ]));
  }
}
