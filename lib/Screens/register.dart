import 'package:flutter/material.dart';
import 'package:notes_app/Database/secure_storage.dart';
import '../Constants/constants.dart';
import '../Themes/themes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: MyColors.primaryColor,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Hello!", style: MyTheme.titleLargeStyle),
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.secondaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30),
                      ),
                    ),
                    child: FormWidgets(),
                  ),
                  Positioned(
                    top: -150,
                    right: 0,
                    // bottom: 0,
                    child: Image.asset(
                      width: 110,
                      "assets/Images/Plant_Illustration.png",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormWidgets extends StatefulWidget {
  const FormWidgets({super.key});

  @override
  State<FormWidgets> createState() => _FormWidgetsState();
}

class _FormWidgetsState extends State<FormWidgets> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: SizedBox(
          // color: Colors.grey,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Register", style: MyTheme.headingStyle),
              SizedBox(height: Measurements.normalSpacing),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      cursorColor: MyColors.primaryColor,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: MyTheme.textFieldStyle.copyWith(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: MyColors.tertiaryColor,
                        ),
                        hintText: "Username",
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: MyColors.primaryColor,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: MyTheme.textFieldStyle.copyWith(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: MyColors.tertiaryColor,
                        ),
                        hintText: "Email",
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
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: MyColors.primaryColor,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: MyTheme.textFieldStyle.copyWith(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: MyColors.tertiaryColor,
                        ),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is empty";
                        } else if (value.length < 6) {
                          return "Password should have at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Measurements.normalSpacing),
              ElevatedButton(
                style: MyTheme.primaryButtonStyle,
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    await authService.saveUser(
                      name: _userNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: Text("Register"),
              ),
              SizedBox(height: Measurements.normalSpacing),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or login with"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: Measurements.normalSpacing),
              ElevatedButton(
                style: MyTheme.primaryButtonStyle,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text("Login"),
              ),
              SizedBox(height: Measurements.normalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
