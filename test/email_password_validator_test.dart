import 'package:flutter_test/flutter_test.dart';
import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/domain/service/validator.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/fav/fav_actions.dart';



import 'widget_test.dart';

void main() {
  test('Empty Email Test', () {
    var result = Validator.validateEmail('');
    expect(result, false);
  });
  test('Invalid Email Test', () {
    var result = Validator.validateEmail('');
    expect(result, false);
  });

  test('Valid Email Test', () {
    var result = Validator.validateEmail('ajay.kumar@nonstopio.com');
    expect(result, true);
  });

  test('Empty Password Test', () {
    var result = Validator.validatePassword('');
    expect(result, false);
  });

  test('Invalid Password Test', () {
    var result = Validator.validatePassword('123');
    expect(result, false);
  });

  test('Valid Password Test', () {
    var result = Validator.validatePassword('ajay12345');
    expect(result, true);
  });
  test('Fav State', () async* {
    AppState.initial();
    expect(store.state.favState.articlesDto, []);
    yield Stream.value(SaveFavAction(news: const ArticlesDto(
        url: 'fff',
        title: 'ddd',
        publishedAt: 'dddd',
        description: 'ddd',
        content: 'ffff',
        author: 'jhjj',
        urlToImage: 'fff'),
    ),);


       expect(store.state.favState.articlesDto, null!);
  });
}