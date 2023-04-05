import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/globalStates/user.dart';
import 'package:marketapp/main.dart';

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
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          color: Color.fromARGB(217, 252, 211, 62),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: users
                .map((user) => Wrap(
                      spacing: 15,
                      direction: Axis.vertical,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(user.name),
                        Text(user.surname),
                        Text(user.email),
                        Text(user.password),
                      ],
                    ))
                .toList(),
          ),
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
