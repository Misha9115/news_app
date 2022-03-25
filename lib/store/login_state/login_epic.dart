import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_paper/res/app_routes.dart';
import 'package:news_paper/route_helper/route_helper.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/login_state/action/login_action.dart';
import 'package:news_paper/store/login_state/action/registration_action.dart';
import 'package:news_paper/store/login_state/action/save_user_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class LoginEpic {
  static const String tag = '[LoginEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getLogin, _getRegistration]);

  static Stream<dynamic> _getRegistration(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RegistrationAction>().switchMap(
      (action) async* {
        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential result = await auth.createUserWithEmailAndPassword(email: action.email, password: action.password);
        if (result.user != null) {
          yield* Stream.value(SaveUserAction(user: result.user!));
          Navigator.of(RouteHelper.instance.navigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(AppRoutes.homePage, (Route<dynamic> route) => false);
        }
      },
    );
  }

  static Stream<dynamic> _getLogin(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<LoginAction>().switchMap(
      (action) async* {
        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential result = await auth.signInWithEmailAndPassword(email: action.email, password: action.password);
        if (result.user != null) {
          yield* Stream.value(SaveUserAction(user: result.user!));
          Navigator.of(RouteHelper.instance.navigatorKey.currentContext!)
              .pushNamedAndRemoveUntil(AppRoutes.homePage, (Route<dynamic> route) => false);
        }
      },
    );
  }
}
