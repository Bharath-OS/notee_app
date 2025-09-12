import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Models/note.dart';

class Database {
  // Database._construct();
  // static final Database _instance = Database._construct();
  static final _myBox = Hive.box('myBox');
  static final _myNote = Hive.box<Note>('myNotes');
  static Box get _box=> _myBox;
  static Box<Note> get myNote => _myNote;

  static const String _usernameKey = "username";
  static const String _emailKey = "email";
  static const String _passwordKey = 'password';
  static const String _isRegistered = 'isRegistered';
  static const String _isLoggedIn = 'isLoggedIn';

  static String get getUsername => _box.get(_usernameKey)??'';
  static String get getEmail => _box.get(_emailKey)?? '';
  static String get getPassword => _box. get(_passwordKey)??'';
  static bool get getIsLogged => _box.get(_isLoggedIn)??false;
  static bool get getIsRegistered => _box.get(_isRegistered)??false;

  static saveData({required String username, required String email, required String password,}){
    _box.put(_usernameKey, username);
    _box.put(_emailKey, email);
    _box.put(_passwordKey, password);
    _box.put(_isRegistered,true);
  }
  


  static bool isLogged(String email, String password){
    String savedEmail = _box.get(_emailKey);
    String savedPassword = _box.get(_passwordKey);
    if(savedEmail == email && savedPassword == password){
      _box.put(_isLoggedIn, true);
      return true;
    }
    else{
      return false;
    }
  }
  static showData(){
    print(_box.get(_usernameKey));
    print(_box.get(_emailKey));
    print(_box.get(_passwordKey));
    print(_box.get(_isRegistered));
    print(_box.get(_isLoggedIn));
  }

  static logout(){
    _box.put(_isLoggedIn,false);
  }
}