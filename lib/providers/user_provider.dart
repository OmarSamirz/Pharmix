import 'package:pharmix/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateUser(User newUser) {
    state = newUser;
  }
}

final userNotifier = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User(
    userID: -1,
    fname: 'fname',
    lname: 'lname',
    email: 'email',
    password: 'password',
  )),
);
