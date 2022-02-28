import 'package:news_paper/domain/entity/articles/articles_dto.dart';
import 'package:news_paper/store/base_action.dart';

class SaveSearchNewsAction extends BaseAction {
  final List<ArticlesDto> news;

  SaveSearchNewsAction({
    required this.news,
  }) : super(type: 'SaveSearchNewsAction');
}
