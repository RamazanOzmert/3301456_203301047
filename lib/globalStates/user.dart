import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketapp/firebase/auth.dart';

final usersProvider = StateNotifierProvider<UserNotifier, List<User>>((ref) {
  return UserNotifier(users: [
    const User(
        name: 'Ramazan',
        surname: 'Özmert',
        email: 'ramazan@email.com',
        password: '123456'),
  ]);
});

@immutable
class User {
  final String name;
  final String surname;
  final String email;
  final String password;

  const User({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  User copyWith({
    String? name,
    String? surname,
    String? email,
    String? password,
  }) {
    return User(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier({users}) : super(users);

  void add(User user) {
    createUser(
      user.name,
      user.surname,
      user.email,
      user.password,
    );
    debugPrint('user created: ' + createUser.toString());

    //single profil
    state = [user];
    //multi profile
    //state = [...state, user];
  }

  void changeName(String _name) {
    state = [
      for (final item in state) item.copyWith(name: _name),
    ];
  }

  void changeUser({
    String? name,
    String? surname,
    String? email,
    String? password,
  }) {
    state = [
      for (final item in state)
        item.copyWith(
          name: name,
          surname: surname,
          email: email,
          password: password,
        ),
    ];
  }
}
