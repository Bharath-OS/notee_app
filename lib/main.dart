import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Logics/notesProvider.dart';
import 'package:notes_app/Models/note.dart';
import 'package:notes_app/Screens/home.dart';
import 'package:notes_app/Screens/register.dart';
import 'package:notes_app/Screens/splash.dart';
import 'package:notes_app/Themes/themes.dart';
import 'package:provider/provider.dart';
import 'Constants/constants.dart';
import 'Screens/login.dart';

main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('myNotes');
  await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesProvider>(
      create: (_)=>NotesProvider(),
      child: MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.light()).copyWith(
          textTheme: TextTheme(bodyMedium: MyTheme.bodyMediumStyle),
          primaryColor: MyColors.primaryColor,
        ),
        home: SplashScreen(),
        routes: {
          '/home':(context)=>HomePage(),
          '/login':(context)=>LoginScreen(),
          '/register':(context)=>RegisterPage(),
        },
      ),
    );
  }
}
