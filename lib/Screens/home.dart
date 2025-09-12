import 'package:flutter/material.dart';
import 'package:notes_app/Logics/notesProvider.dart';
import 'package:notes_app/Screens/addnotes.dart';
import 'package:provider/provider.dart';
import '../Constants/constants.dart';
import '../Database/database.dart';
import '../Models/note.dart';
import '../Themes/themes.dart';
import 'edit_notes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App", style: MyTheme.titleMediumStyle),
        centerTitle: true,
        backgroundColor: MyColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Database.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Consumer<NotesProvider>(
          builder: (context, notes, child) {
            if (notes.count > 0) {
              return ListView.builder(
                itemCount: notes.count,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    EditNotePopup(context,index);
                  },
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        context.read<NotesProvider>().deleteTask(index);
                      },
                      icon: Icon(Icons.delete_outline),
                    ),
                    title: Text(Database.myNote.values.elementAt(index).title),
                  ),
                ),
              );
            } else {
              return Text("Add notes to show here.");
            }
          },
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: () => context.read<NotesProvider>().deleteAll(),
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 10,),
          AddNotesPage(),
        ],
      ),
    );
  }
}
