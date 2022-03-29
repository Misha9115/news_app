import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/base_action.dart';

class AddNewsAction extends BaseAction {
  final List<ArticlesDto> news;

  AddNewsAction({
    required this.news,
  }) : super(type: 'AddNewAction');
}

class ChangeNumberPageAction extends BaseAction {
  final int page;

  ChangeNumberPageAction({
    required this.page,
  }) : super(type: 'ChangeNumberPageAction');
}

class ChangePageAction extends BaseAction {
  final int page;

  ChangePageAction({
    required this.page,
  }) : super(type: 'ChangePageAction');
}

class ClearNewsAction extends BaseAction {
  ClearNewsAction() : super(type: 'ClearNewsAction');
}

class GetNewsAction extends BaseAction {
  GetNewsAction() : super(type: 'GetNewsAction');
}

class GetPaginationAction extends BaseAction {
  final int pageSize;

  GetPaginationAction({
    required this.pageSize,
  }) : super(type: 'GetPaginationAction');
}

class SaveNewsAction extends BaseAction {
  final NewsListDto news;

  SaveNewsAction({
    required this.news,
  }) : super(type: 'SaveNewsAction');
}
