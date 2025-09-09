import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Themes/themes.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  void dispose(){
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.primaryColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: MyColors.secondaryColor,
            title: Text("Add Note", style: MyTheme.bodyMediumStyle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        style: MyTheme.bodyMediumStyle,
                        decoration: MyTheme.textFieldStyle.copyWith(
                          hintText: "Note Title...",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: MyTheme.bodyMediumStyle,
                        controller: _contentController,
                        decoration: MyTheme.textFieldStyle.copyWith(
                          hintText: "Write your note here...",
                        ),
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field is empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _titleController.clear();
                        _contentController.clear();
                        Navigator.pop(context);
                      },
                      style: MyTheme.secondaryButtonStyle,
                      child: Text("Cancel"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _titleController.clear();
                          _contentController.clear();
                          Navigator.pop(context);
                        }
                      },
                      style: MyTheme.primaryButtonStyle,
                      child: Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );;
      },
      child: Icon(Icons.add, size: 30),
    );
  }
}
