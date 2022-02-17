import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class SaveFavAction extends BaseAction {
  final ArticlesDto news;

  SaveFavAction({
    required this.news,
  }) : super(type: 'SaveFavAction');
}
