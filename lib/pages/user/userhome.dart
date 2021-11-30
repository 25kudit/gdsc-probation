// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gdsc/pages/user/userdrawer.dart';
import 'package:google_fonts/google_fonts.dart';

class User_Home extends StatelessWidget {
  String name;
  User_Home({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: UserDrawer(username: name),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi ",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 60,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
