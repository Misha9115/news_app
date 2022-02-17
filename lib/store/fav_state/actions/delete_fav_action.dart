import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class DeleteFavAction extends BaseAction {
  final ArticlesDto news;

  DeleteFavAction({
    required this.news,
  }) : super(type: 'DeleteFavAction');
}
