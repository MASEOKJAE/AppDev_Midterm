import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  
  @override
    _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _usernamecreateController = TextEditingController();
  final _passwordcreateController = TextEditingController();
  final _passwordcheckController = TextEditingController();
  final _emailcreateontroller = TextEditingController();

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
                  if(value!=_passwordcreateController.text){
                    return "Passwords do not match!";
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