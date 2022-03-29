import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class ChangeNumberSearchPageAction extends BaseAction {
  final int page;

  ChangeNumberSearchPageAction({
    required this.page,
  }) : super(type: 'ChangeNumberSearchPageAction');
}

class ChangeSearchPageAction extends BaseAction {
  final int page;
  final String request;

  ChangeSearchPageAction({
    required this.page,
    required this.request,
  }) : super(type: 'ChangeSearchPageAction');
}

class ClearNewsSearchAction extends BaseAction {
  ClearNewsSearchAction() : super(type: 'ClearNewsSearchAction');
}

class GetSearchNewsAction extends BaseAction {
  final String searchRequest;
  final int pageSize;

  GetSearchNewsAction({
    required this.searchRequest,
    required this.pageSize,
  }) : super(type: 'GetSearchNewsAction');
}

class PaginationSearchNewsAction extends BaseAction {
  final int page;
  final String q;

  PaginationSearchNewsAction({
    required this.q,
    required this.page,
  }) : super(type: 'ChangePageAction');
}

class SaveSearchNewsAction extends BaseAction {
  final List<ArticlesDto> news;

  SaveSearchNewsAction({
    required this.news,
  }) : super(type: 'SaveSearchNewsAction');
}
