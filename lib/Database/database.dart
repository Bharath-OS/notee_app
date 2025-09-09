import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  static Box get _box=> Hive.box('myBox');

  static const String _usernameKey = "username";
  static const String _emailKey = "email";
  static const String _passwordKey = 'password';
  static const String _isRegistered = 'isRegistered';
  static const String _isLoggedIn = 'isLoggedIn';

  static String get getUsername => _box.get(_usernameKey);
  static String get getEmail => _box.get(_emailKey);
  static String get getPassword => _box. get(_passwordKey);

  static saveData({required String username, required String email, required String password,}){
    _box.put(_usernameKey, username);
    _box.put(_emailKey, email);
    _box.put(_passwordKey, password);
    _box.put(_isRegistered,true);
  }
  static showData(){
    print(_box.get(_usernameKey));
    print(_box.get(_emailKey));
    print(_box.get(_passwordKey));
    print(_box.get(_isRegistered));
    print(_box.get(_isLoggedIn));
  }
}