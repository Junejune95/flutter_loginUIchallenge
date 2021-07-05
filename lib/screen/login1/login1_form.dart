import 'package:flutter/material.dart';
import 'package:loginUIchallenge/screen/list/list_screen.dart';

class Login1Form extends StatefulWidget {
  @override
  _Login1FormState createState() => _Login1FormState();
}

class _Login1FormState extends State<Login1Form> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            _buildEmailTextFormField(),
            SizedBox(
              height: 20,
            ),
            _buildPasswordTextFormField(),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              },
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ListScreen()),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      cursorColor: Colors.greenAccent,
      textAlign: TextAlign.center,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        final RegExp emailValidatorRegExp =
            RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        email = value;
        if (value == null || value.isEmpty) {
          return 'Enter Your email';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return 'Enter Your Valid Email';
        }
        return null;
      },
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white54,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.5),
            borderRadius: BorderRadius.circular(50.0)),
        hintText: 'Email',
      ),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      cursorColor: Colors.greenAccent,
      textAlign: TextAlign.center,
      onSaved: (newValue) => email = newValue,
      obscureText: !_showPassword,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
      validator: (value) {
        password = value;
        if (value == null || value.isEmpty) {
          return 'Enter Your Password';
        } else if (password.length < 8) {
          return 'At least 8 characters include';
        }
        return null;
      },
      decoration: InputDecoration(
        suffix: GestureDetector(
          onTap: () {
            _togglevisibility();
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white54,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.5),
            borderRadius: BorderRadius.circular(50.0)),
        hintText: 'Password',
      ),
    );
  }
}
