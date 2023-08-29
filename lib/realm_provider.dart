import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class RealmWithMongoDb extends ChangeNotifier {
  final app = App(AppConfiguration("application-0-ekmzi"));
  late User? user;

  Future register(String email, String password) async {
    try {
      EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
      await authProvider.registerUser(email, password);
      user = app.currentUser;
      // log(user!.profile.email.toString());
      notifyListeners();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future login(String email, String password) async {
    try {
      final emailPwCredentials = Credentials.emailPassword(email, password);
      await app.logIn(emailPwCredentials);
      user = app.currentUser;
      notifyListeners();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> anonamusRegister() async {
    user = await app.logIn(Credentials.anonymous());
    
  }

  Future logout() async {
    try {
      await user!.logOut();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
