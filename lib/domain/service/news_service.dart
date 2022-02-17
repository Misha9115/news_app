import 'dart:core';

import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';

abstract class NewsService {
  Future<NewsListDto> getNews(
    String searchWord,
    String apiKey,
  );

// Future<SearchByBarcode> searchByBarcode(String barcode);
//
// Future<List<BooksRecommended>> getBooks({String addressId, String filter, int offset, int count});
//
// Future<List<BaseBook>> getBooksForRegistration(int offset, int count);
//
// Future<BaseBook> getBookById(String bookId);
//
// Future<List<BooksRecommendedTabs>> getBooksRecommendedTabs();
//
// Future<List<BaseBook>> searchByNameBooks({String text, double latitude, double longitude, int distance, int offset, int count});
//
// Future<List<BaseBook>> searchLibraryByNameBooks({String text, int offset, int count});
}
