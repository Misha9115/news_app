import 'package:firebase_database/firebase_database.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';

class NewsDao {
  final DatabaseReference _newsRef = FirebaseDatabase.instance.reference().child('news');

  void saveNews(ArticlesDto news,String userID) {
    _newsRef.child(userID).push().set(news.toJson());
  }
  void deleteNews(String keyS,String userID) {
    _newsRef.child(userID).child(keyS).remove();
  }
  Query getNewsQuery(String userID) {
    return _newsRef.child(userID);
  }
}
