import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Themes/themes.dart';

import 'Constants/constants.dart';
import 'Screens/login.dart';

main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(colorScheme: ColorScheme.light()).copyWith(
        textTheme: TextTheme(bodyMedium: MyTheme.bodyMediumStyle),
        primaryColor: MyColors.primaryColor,
      ),
    );
  }
}
