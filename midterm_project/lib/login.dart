import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // createState 메소드는 Flutter 프레임워크에게 이 StatefulWidget의 상태 관리 객체가 _LoginPageState라고 알려 줌
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)


            // TODO: Add TextField widgets (101)
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            // TODO: Add button bar (101)
            // OverflowBar는 그 하위 요소를 한 행으로 정렬
            OverflowBar(
              alignment: MainAxisAlignment.end,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                     // TODO: Show the next page (101)
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}