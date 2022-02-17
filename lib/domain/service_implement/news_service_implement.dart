// import 'package:logging/logging.dart';
// import 'package:news_paper/data/network/repositories/news/news_repository.dart';
// import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
// import 'package:news_paper/domain/service/news_service.dart';
//
// //@LazySingleton(as: NewsService)
// class NewsServiceImpl implements NewsService {
//   NewsServiceImpl(this._repository);
//
//   final NewsRepository _repository;
//
//   Logger get _logger => Logger('[$runtimeType]');
//
//   // @override
//   // Future<List<BooksRecommended>> getBooks({String addressId, String filter, int offset, int count}) async {
//   //   final List<BooksRecommended> books = await _repository.getBooks(
//   //     addressId: addressId,
//   //     filter: filter,
//   //     offset: offset,
//   //     count: count,
//   //   );
//   //   if (books != null) {
//   //     _logger.info('<getBooks> => Loaded from server!');
//   //     return books;
//   //   }
//   //   return null;
//   // }
//
//   @override
//   Future<NewsListDto> getNews() async {
//     final NewsListDto book = await _repository.getNews();
//     if (book != null) {
//       _logger.info('<getBookById> => Loaded from server!');
//       return book;
//     }
//     return const NewsListDto(
//       totalResults: 0,
//       articles: [],
//       status: '',
//     );
//   }
//
// // @override
// // Future<NewsListDto> getNews(String searchWord, String apiKey) {
// //   // TODO: implement getNews
// //   throw UnimplementedError();
// // }
//
// // @override
// // Future<List<BaseBook>> getBooksForRegistration(int offset, int count) async {
// //   final List<BaseBook> books = await _repository.getBooksForRegistration(offset, count);
// //   if (books != null) {
// //     _logger.info('<getBooks> => Loaded from server!');
// //     return books;
// //   }
// //   return null;
// // }
//
// // @override
// // Future<SearchByBarcode> searchByBarcode(String barcode) async {
// //   final SearchByBarcode books = await _repository.searchByBarcode(barcode);
// //   if (books != null) {
// //     _logger.info('<searchByBarcode> => Loaded from server!');
// //     return books;
// //   }
// //   return null;
// // }
//
// // @override
// // Future<List<BaseBook>> searchByNameBooks({String text, double latitude, double longitude, int distance, int offset, int count}) async {
// //   final List<BaseBook> books = await _repository.searchByNameBooks(
// //     text: text,
// //     distance: distance,
// //     latitude: latitude,
// //     longitude: longitude,
// //     offset: offset,
// //     count: count,
// //   );
// //   if (books != null) {
// //     _logger.info('<searchByNameBooks> => Loaded from server!');
// //     return books;
// //   }
// //   return null;
// // }
//
// // @override
// // Future<List<BaseBook>> searchLibraryByNameBooks({String text, int distance, int offset, int count}) async {
// //   final List<BaseBook> books = await _repository.searchLibraryByNameBooks(
// //     text: text,
// //     offset: offset,
// //     count: count,
// //   );
// //   if (books != null) {
// //     _logger.info('<searchByNameBooks> => Loaded from server!');
// //     return books;
// //   }
// //   return null;
// // }
//
// // @override
// // Future<List<BooksRecommendedTabs>> getBooksRecommendedTabs() async {
// //   final List<BooksRecommendedTabs> booksRecommendedTabs = await _repository.getBooksTabs();
// //   if (booksRecommendedTabs != null) {
// //     _logger.info('<getBooksTabs> => Loaded from server!');
// //     return booksRecommendedTabs;
// //   }
// //   return null;
// // }
// }
