import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/user.dart';
import 'package:marketapp/screens/main_screen.dart';

import 'package:marketapp/screens/usr_login.dart';
import 'package:marketapp/widgets/link_button.dart';

class UserRegister extends ConsumerStatefulWidget {
  const UserRegister({Key? key}) : super(key: key);
  ConsumerState<UserRegister> createState() => _UserRegister();
}

class _UserRegister extends ConsumerState<UserRegister> {
  @override
  void initState() {
    super.initState();
  }

  var invisibility = true;
  final _formKey = GlobalKey<FormState>();
  Map user = {
    "name": '',
    "surname": '',
    "email": '',
    "password": '',
  };

  void submit() {
    ref.read(usersProvider.notifier).add(User(
        name: user['name'],
        surname: user['surname'],
        email: user['email'],
        password: user['password']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5AA9E6),
        centerTitle: true,
        title: const Text(
          'Üye ol',
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
          child: Wrap(runSpacing: 10, children: [
            /* //Phone
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    cursorColor: Theme.of(context).canvasColor,
                    initialValue: '90',

                    keyboardType: TextInputType.number, //only numbers input
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ülke/Bölge Kodu',
                      labelStyle: TextStyle(fontSize: 14),
                      hintText: ' (90)',
                      prefixText: '+ ',
                      prefixStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      helperText: '',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cep Telefonu',
                    ),
                  ),
                ),
              ],
            ),
           */
            //name&surname
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ad',
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'bilgileri eksiksiz doldurunuz.';
                      else {}
                    },
                    onSaved: (value) {
                      setState(() {
                        user['name'] = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Soyad',
                    ),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'bilgileri eksiksiz doldurunuz.';
                      else {}
                    },
                    onSaved: (value) {
                      setState(() {
                        user['surname'] = value;
                      });
                    },
                  ),
                ),
              ],
            ),

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

            //info line
            ListTile(
              leading: Icon(Icons.info),
              title: RichText(
                text: TextSpan(
                  text: 'Üye olmakla, ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).focusColor,
                  ),
                  children: const <InlineSpan>[
                    WidgetSpan(
                      child: LinkButton(
                        btnLabel: "Kullanım Koşullarını ",
                      ),
                    ),
                    TextSpan(
                      text: 'kabul etmektesiniz. ',
                    ),
                  ],
                ),
              ),
            ),
            //Button: 'üye Ol'
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
                child: const Text(
                  'Üye Ol',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            //info line: Connect with account
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
                  'veya hesabınızla bağlanın',
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
            //Connection buttons
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
                      icon: const Icon(
                        Icons.facebook_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
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
            //Button: 'giriş yap'
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hesabınız var mı?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserLogin()));
                    },
                    child: Text('Giriş Yap'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
