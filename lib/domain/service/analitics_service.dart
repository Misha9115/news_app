import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> registrationFinish({required String userID})  {
    return _analytics.logEvent(
      name: 'registration_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }

  Future<void> loginFinish({required String userID})  {
    return _analytics.logEvent(
      name: 'login_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }

  Future<void> loginWithGoogle({required String userID})  {
    return _analytics.logEvent(
      name: 'login_with_google_finish',
      parameters: {
        'UserID': userID,
      },
    );
  }

  Future<void> searchNews({required String userID, required String searchRequest})  {
    return _analytics.logEvent(
      name: 'search_news',
      parameters: {'UserID': userID, 'searchRequest': searchRequest},
    );
  }

  Future<void> addToFav({required String userID, required String link})  {
    return _analytics.logEvent(
      name: 'add_to_fav',
      parameters: {'UserID': userID, 'link': link},
    );
  }

  Future<void> deleteToFav({required String userID, required String link})  {
    return _analytics.logEvent(
      name: 'delete_to_fav',
      parameters: {'UserID': userID, 'link': link},
    );
  }

  Future<void> changePage({required String pageName})  {
    return _analytics.logEvent(
      name: 'change_page',
      parameters: {
        'pageName': pageName,
      },
    );
  }
}
