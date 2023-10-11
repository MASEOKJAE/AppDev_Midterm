import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  
  @override
    _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernamecreateController = TextEditingController();
  final _passwordcreateController = TextEditingController();
  final _passwordcheckController = TextEditingController();
  final _emailcreateontroller = TextEditingController();

  bool nameChecker(String str) {
    int chCount = 0, numCount = 0;
    bool result;

    for(int i=0; i<str.length; i++) {
        if((str[i].codeUnitAt(0) >= 'a'.codeUnitAt(0) && str[i].codeUnitAt(0) <= 'z'.codeUnitAt(0))
          || (str[i].codeUnitAt(0) >= 'A'.codeUnitAt(0) && str[i].codeUnitAt(0) <= 'Z'.codeUnitAt(0))) {
          chCount++;
        } else if(str[i].codeUnitAt(0) >= '0'.codeUnitAt(0) && str[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
          numCount++;
        }
    }
    if((chCount >= 3) && (numCount >= 3)) {
      result = true;
    } else {
      result = false;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
           padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              // spacer
              const SizedBox(height: 50.0),
      
              TextFormField(
                controller: _usernamecreateController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                 validator:(value) {
                  if(value == null || !nameChecker(value)) {
                    return "Username is invalid";
                  }
                  return null;
                },
              ),
      
              // spacer
              const SizedBox(height: 12.0),
      
              TextFormField(
                controller: _passwordcreateController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
      
              // spacer
              const SizedBox(height: 12.0),
      
              TextFormField(
                controller: _passwordcheckController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Confrim Password',
                ),
                validator:(value){
                  if(value!=_passwordcreateController.text) {
                    return "Confirm Passwords doesn't match Password";
                  }
                  return null;
                },
                obscureText: true,
              ),
      
              // spacer
              const SizedBox(height: 12.0),
      
              TextFormField(
                controller: _emailcreateontroller,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
                validator:(value){
                  if(value == null || value.isEmpty) {
                    return "Please enter Email Address";
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 12.0),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ElevatedButton(
                child: const Text('SIGN UP'),
                onPressed:() {
                      if(_formKey.currentState!.validate()){
                       Navigator.pop(context);
                     }
                    },
                ),
              ],)
            ]
          ),
        )
      ),
    );
  }
}