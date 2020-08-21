import 'package:flutter/material.dart';
import 'package:premierchoixadmin/screens/admin.dart';
import 'package:premierchoixadmin/test.dart';

import 'components/hexadecimal.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: HexColor("#001C36"),
        brightness: Brightness.light,
        accentColor: HexColor("#001C36"),
        colorScheme: ColorScheme.light(primary: HexColor("#001C36")),
      ),
      initialRoute: Test.id,
      routes: {
        Admin.id: (context) => Admin(),
        Test.id: (context) => Test(),

      },
    );
  }
}