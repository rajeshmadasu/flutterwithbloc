import 'package:flutter/material.dart';

import 'app.dart';
import 'login_repository/authentication_repository.dart';
import 'user_repository/user_repository.dart';

void main() {
  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}
