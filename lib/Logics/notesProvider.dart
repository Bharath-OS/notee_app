import '../Database/database.dart';
import '../Models/note.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  int get count => Database.myNote.values.length;

  void addNote({required String title, required String description}) async {
    await Database.myNote.add(Note(title: title, description: description));
    notifyListeners();
  }

  void editNote({required String title, required String description, required int index})async{
    Note currentNote = Database.myNote.values.elementAt(index);
    currentNote.title = title;
    currentNote.description = description;
    await currentNote.save();
    notifyListeners();
  }

  void deleteTask(int index){
    Database.myNote.deleteAt(index);
    notifyListeners();
  }

  void deleteAll(){
    Database.myNote.clear();
    notifyListeners();
  }
}
