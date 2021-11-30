// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdsc/pages/admin/adminhome.dart';
import 'package:gdsc/pages/admin/adminlogin.dart';
import 'package:gdsc/pages/register.dart';
import 'package:gdsc/pages/user/userforget.dart';
import 'package:gdsc/pages/user/userhome.dart';
import 'package:gdsc/pages/userlogin.dart';
import 'package:gdsc/themes.dart';

void main() {
  runApp(gdsc());
}

class gdsc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme1(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/userlogin",
      routes: {
        "/userlogin": (context) => User_Login(),
        "/userhome": (context) => User_Home(name: '',),
        "/adminlogin": (context) => Admin_Login(),
        "/adminhome": (context) => Admin_Home(),
        "/register": (context) => Register(),
        "/forget":(context)=> Forget(),
      },
    );
  }
}
