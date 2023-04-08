import 'package:flutter/material.dart';

import 'package:marketapp/screens/usr_login.dart';
import 'package:marketapp/widgets/link_button.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({Key? key}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Wrap(runSpacing: 10, children: [
          //Phone
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
                ),
              ),
            ],
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-posta',
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
          //Button: 'Giriş Yap'
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  fixedSize:
                      Size.fromWidth(MediaQuery.of(context).size.width / 1.5)),
              onPressed: () {},
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
          //Button: 'Üye Ol'
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
    );
  }
}
