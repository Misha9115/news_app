import 'package:news_paper/domain/entity/news_list/news_list_dto.dart';
import 'package:news_paper/store/base_action.dart';

class SaveNewsAction extends BaseAction {
  final NewsListDto news;

  SaveNewsAction({
    required this.news,
  }) : super(type: 'SaveNewsAction');
}
