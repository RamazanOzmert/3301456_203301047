import 'package:flutter/material.dart';
import 'package:marketapp/firebase/auth.dart';
import 'package:marketapp/screens/main_screen.dart';

import 'package:marketapp/screens/usr_register.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  State createState() => _UserLogin();
}

class _UserLogin extends State<UserLogin> {
  var invisibility = true;
  final _formKey = GlobalKey<FormState>();
  Map user = {
    "name": '',
    "password": '',
  };

  submit() {
    SignInUser(user['email'], user['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        title: const Text(
          'Giriş',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            //fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Wrap(runSpacing: 20, children: [
            Column(
              children: [
                //eposta
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-posta',
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'bilgileri eksiksiz doldurunuz.';
                    else {}
                  },
                  onSaved: (value) {
                    setState(() {
                      user['email'] = value;
                    });
                  },
                ),
                //password
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: invisibility, //visible value
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'bilgileri eksiksiz doldurunuz.';
                    else {}
                  },
                  onSaved: (value) {
                    setState(() {
                      user['password'] = value;
                    });
                  },
                  decoration: invisibility
                      ? InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Şifre',
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {
                              invisibility = !invisibility;
                            }),
                            icon: Icon(Icons.visibility_off),
                          ),
                        )
                      : InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Şifre',
                          suffixIcon: IconButton(
                            onPressed: () => setState(() {
                              invisibility = !invisibility;
                            }),
                            icon: Icon(Icons.visibility),
                          ),
                        ),
                ),
              ],
            ),
            //info
            ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'Giriş için cep telefonunuza tek kullanımlık şifre göndereceğiz.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).focusColor,
                  ),
                )),
            //button giriş yap
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    fixedSize: Size.fromWidth(
                        MediaQuery.of(context).size.width / 1.5)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    submit();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  } else {}
                },
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Theme.of(context).focusColor,
                  ),
                ),
                Text(
                  'veya hesabınıza bağlanın',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Theme.of(context).focusColor,
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 24,
                        width: 24,
                      ),
                      label: const Text(
                        "Google",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          surfaceTintColor: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook_rounded,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Facebook',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hesabınız yok mu?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserRegister()));
                  },
                  child: Text('Üye Ol'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
