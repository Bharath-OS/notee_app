import 'package:flutter/material.dart';
import 'package:notes_app/Screens/addnotes.dart';

import '../Constants/constants.dart';
import '../Themes/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App", style: MyTheme.titleMediumStyle),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return Text("Nothing to show");
          },
        ),
      ),
      floatingActionButton:AddNotesPage()
    );
  }
}
