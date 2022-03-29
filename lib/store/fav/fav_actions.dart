import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class DeleteFavAction extends BaseAction {
  final ArticlesDto news;

  DeleteFavAction({
    required this.news,
  }) : super(type: 'DeleteFavAction');
}

class GetDataRomDataBaseAction extends BaseAction {
  GetDataRomDataBaseAction() : super(type: 'GetDataRomDataBaseAction');
}

class SaveFavAction extends BaseAction {
  final ArticlesDto news;

  SaveFavAction({
    required this.news,
  }) : super(type: 'SaveFavAction');
}

class SaveListFavAction extends BaseAction {
  final List<ArticlesDto> news;

  SaveListFavAction({
    required this.news,
  }) : super(type: 'SaveListFavAction');
}

class SaveToDataBaseAction extends BaseAction {
  final ArticlesDto news;

  SaveToDataBaseAction({
    required this.news,
  }) : super(type: 'SaveToDataBaseAction');
}
