import 'package:get_it/get_it.dart';
import 'package:news_paper/domain/service/network_service/network_service.dart';
import 'package:news_paper/network/chat_repository_impl.dart';
import 'package:news_paper/network/i_chat_repository.dart';
import 'package:news_paper/network/rest_api.dart';

final getIt = GetIt.instance;

class CustomLocator {
  static void initLocator() {
    getIt.registerSingleton<RestApiNews>(RestApiNews(NetworkService.instance.dio));
    getIt.registerSingleton<IChatRepository>(ChatRepositoryImpl());
  }
}
