import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class SaveToDataBaseAction extends BaseAction {
  final ArticlesDto news;

  SaveToDataBaseAction({
    required this.news,
  }) : super(type: 'SaveToDataBaseAction');
}
