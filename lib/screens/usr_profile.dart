import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/user.dart';

class UsrProfile extends ConsumerStatefulWidget {
  const UsrProfile({Key? key}) : super(key: key);
  @override
  ConsumerState<UsrProfile> createState() => _UsrProfile();
}

class _UsrProfile extends ConsumerState<UsrProfile> {
  @override
  void initState() {
    super.initState();
  }

  var invisibility = true;
  @override
  Widget build(BuildContext context) {
    var users = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF5AA9E6),
        title: const Text(
          'Senin Profilin',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              //color: Color.fromARGB(217, 252, 211, 62),
              child: Stack(
                children: [
                  Container(
                    color: Color.fromARGB(255, 102, 186, 249),
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      //margin: EdgeInsets.all(50.0),
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5.0),
                      ),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(150.0),
                        child: Image.asset(
                          'assets/images/firstPage.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 50,
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              child: Wrap(runSpacing: 10, spacing: 10, children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    initialValue: users.first.name,
                    onChanged: (value) => ref
                        .read(usersProvider.notifier)
                        .changeUser(name: value.toString()),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ad',
                      labelText: 'Ad',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    initialValue: users.first.surname,
                    onChanged: (value) => ref
                        .read(usersProvider.notifier)
                        .changeUser(surname: value.toString()),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Soyad',
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: users.first.email,
                  onChanged: (value) => ref
                      .read(usersProvider.notifier)
                      .changeUser(email: value.toString()),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E Posta',
                  ),
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    initialValue: users.first.password,
                    obscureText: invisibility, //visible value
                    onChanged: (value) => ref
                        .read(usersProvider.notifier)
                        .changeUser(password: value.toString()),
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
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
