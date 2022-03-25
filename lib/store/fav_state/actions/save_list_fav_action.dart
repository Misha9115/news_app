import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class SaveListFavAction extends BaseAction {
  final List<ArticlesDto> news;

  SaveListFavAction({
    required this.news,
  }) : super(type: 'SaveListFavAction');
}
