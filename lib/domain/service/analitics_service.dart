import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


class AnalyticService{
  final FirebaseAnalytics _analytics = FirebaseAnalytics();
  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);



  Future registrationFinish({required String userID}) async {
    await _analytics.logEvent(
      name: 'registration_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }
  Future loginFinish({required String userID}) async {
    await _analytics.logEvent(
      name: 'login_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }
  Future loginWithGoogle({required String userID}) async {
    await _analytics.logEvent(
      name: 'login_with_google_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }
  Future searchNews({required String userID,required String searchRequest}) async {
    await _analytics.logEvent(
      name: 'search_news',
      parameters: {
        'UserID': userID,
        'searchRequest': searchRequest
      },
    );
  }
  Future addToFav({required String userID,required String link}) async {
    await _analytics.logEvent(
      name: 'add_to_fav',
      parameters: {
        'UserID': userID,
        'link': link
      },
    );
  }
  Future deleteToFav({required String userID,required String link}) async {
    await _analytics.logEvent(
      name: 'delete_to_fav',
      parameters: {
        'UserID': userID,
        'link': link
      },
    );
  }
}