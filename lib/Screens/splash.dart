import 'package:flutter/material.dart';
import 'package:notes_app/Themes/themes.dart';

import '../Constants/constants.dart';
import '../Database/database.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _switchScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(child: Text("Notee",style: MyTheme.titleLargeStyle,),),
    );
  }
  Future<void> _switchScreen()async{
    await Future.delayed(Duration(seconds: 2));
    bool isLogged = Database.getIsLogged;
    bool isRegistered = Database.getIsRegistered;
    // print("Registered value: ${isRegistered}\nLogin Value: ${isLogged}");
    if(!mounted) return;
    if(isLogged && isRegistered){
      Navigator.pushReplacementNamed(context, '/home');
    }
    else if(isRegistered && !isLogged){
      Navigator.pushReplacementNamed(context, '/login');
    }
    else{
      Navigator.pushReplacementNamed(context, '/register');
    }
  }
}
