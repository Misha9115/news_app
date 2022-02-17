import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class AddNewsAction extends BaseAction {
  final List<ArticlesDto> news;

  AddNewsAction({
    required this.news,
  }) : super(type: 'AddNewAction');
}
