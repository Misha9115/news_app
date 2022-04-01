import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_paper/domain/service/analitics_service.dart';
import 'package:news_paper/route_manager/routes.dart';
import 'package:news_paper/route_manager/route_manager.dart';
import 'package:news_paper/shared/locator.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/login/login_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

const String googleLink = 'https://www.googleapis.com/auth/contacts.readonly';
const String googleAccountEmail = 'email';

class LoginEpic {
  static const String tag = '[LoginEpic]';
  static bool tryAgain = true;

  static final indexEpic = combineEpics<AppState>([_getLogin, _getRegistration, registrationWithGoogleEpic]);

  static Stream<dynamic> _getRegistration(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RegistrationAction>().switchMap(
      (action) async* {
        final AnalyticService _analyticsService = getIt<AnalyticService>();

        FirebaseAuth auth = FirebaseAuth.instance;
        UserCredential result;
        try {
          result = await auth.createUserWithEmailAndPassword(email: action.email, password: action.password);
          if (result.user != null) {
            yield* Stream.value(SaveUserAction(user: result.user!));
            await _analyticsService.registrationFinish(userID: result.user!.uid);
            Navigator.of(RouteManager.instance.navigatorKey.currentContext!)
                .pushNamedAndRemoveUntil(AppRoutes.homePage, (Route<dynamic> route) => false);
          }
        } catch (e) {
          await FirebaseCrashlytics.instance.recordError(e, null, reason: 'a non-fatal error');
        }
      },
    );
  }

  static Stream<dynamic> _getLogin(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<LoginAction>().switchMap(
      (action) async* {
        try {
          FirebaseAuth auth = FirebaseAuth.instance;
          final AnalyticService _analyticsService = getIt<AnalyticService>();
          UserCredential result = await auth.signInWithEmailAndPassword(email: action.email, password: action.password);
          if (result.user != null) {
            yield* Stream.value(SaveUserAction(user: result.user!));
            await _analyticsService.loginFinish(userID: result.user!.uid);
            Navigator.of(RouteManager.instance.navigatorKey.currentContext!)
                .pushNamedAndRemoveUntil(AppRoutes.homePage, (Route<dynamic> route) => false);
          }
        } catch (e) {
          await FirebaseCrashlytics.instance.recordError(e, null, reason: 'a non-fatal error');
        }
      },
    );
  }

  static Stream<dynamic> registrationWithGoogleEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RegistrationWithGoogleAction>().switchMap(
      (action) async* {
        final AnalyticService _analyticsService = getIt<AnalyticService>();
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: [googleAccountEmail, googleLink],
        );
        try {
          final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
          final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
          if (googleSignInAuthentication.idToken != null) {
            yield* Stream.value(SaveUserWIthGoogleAction(user: googleSignInAuthentication.idToken!));
            await _analyticsService.loginWithGoogle(userID: googleSignInAuthentication.idToken!);
            Navigator.of(RouteManager.instance.navigatorKey.currentContext!)
                .pushNamedAndRemoveUntil(AppRoutes.homePage, (Route<dynamic> route) => false);
          }
        } catch (e) {
          await FirebaseCrashlytics.instance.recordError(e, null, reason: 'a non-fatal error');
        }
      },
    );
  }
}
