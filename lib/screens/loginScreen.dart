import 'package:cepte/screens/NewHome.dart';

import 'package:cepte/screens/registerScreen.dart';
import 'package:flutter/material.dart';

//void main() => runApp(const MyApp());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String _title = 'Cepte List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: Container(
          child: const MyStatefulWidget(),
        ),
        //child: const MyStatefulWidget(),
        //padding: const EdgeInsets.all(20),
        //margin: const EdgeInsets.all(45),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                //padding: const EdgeInsets.fromLTRB(8,0,8,0),
                child: const Text(
                  'Cepte List',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                Text("Remember me"),
                Checkbox(
                  checkColor: Colors.white,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                  onPressed: () {
                    //sign up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                const Text('Continue without login'),
                TextButton(
                  child: const Text(
                    'login',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyNewHomePage()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
                //height: 30,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.facebook),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Connect With Facebook',
                        style: TextStyle(),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )),
            Container(
                //height: 30,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                //margin: const EdgeInsets.symmetric(vertical: ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.email_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      const Text('Connect With Google'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
