import 'package:flutter/material.dart';
import 'package:notes_app/Database/secure_storage.dart';
import '../Constants/constants.dart';
import '../Themes/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Text("Login", style: MyTheme.headingStyle),
              SizedBox(height: Measurements.normalSpacing),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
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
                onPressed: () async {
                  final user = await authService.getUser();
                  if (_formKey.currentState!.validate()) {
                    if (user[AuthService.emailKey] == _emailController.text &&
                        user[AuthService.passwordKey] ==
                            _passwordController.text) {
                      // print(
                      //   "Username : ${user[AuthService.usernameKey]}\nEmail: ${user[AuthService.emailKey]}\nPassword : ${user[AuthService.passwordKey]}",
                      // );
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Incorrect Email or Password.")),
                      );
                    }
                  }
                },
                child: Text("Login"),
              ),
              SizedBox(height: Measurements.normalSpacing),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("To create a new account"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: Measurements.normalSpacing),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       width: 100,
              //       height: 100,
              //       color: Colors.white,
              //       child: SvgPicture.asset(
              //         "assets/Images/Icons/facebook-logo.svg",
              //         width: 45,
              //         height: 45,
              //       ),
              //     ),
              //     Container(
              //       width: 100,
              //       height: 100,
              //       color: Colors.white,
              //       child: SvgPicture.asset(
              //         "assets/Images/Icons/google-logo.svg",
              //         width: 30,
              //         height: 45,
              //       ),
              //     ),
              //     Container(
              //       width: 100,
              //       height: 100,
              //       color: Colors.white,
              //       child: SvgPicture.asset(
              //         "assets/Images/Icons/apple-logo.svg",
              //         width: 45,
              //         height: 45,
              //       ),
              //     ),
              //   ],
              // ),
              ElevatedButton(
                style: MyTheme.primaryButtonStyle,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Text("Sign up"),
              ),
              SizedBox(height: Measurements.normalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
